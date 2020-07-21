{ pkgs, ... }:

{
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    package = pkgs.nixFlakes;
    gc = {
      automatic = true;
      dates = "hourly";
      options = "--delete-older-than 7d";
    };
    optimise = {
      automatic = true;
      dates = [ "hourly" ];
    };
    trustedUsers = [ "@wheel" ];
  };

  nixpkgs.config = import ./nix-store/config.nix;

  home-manager.users.charlotte = { ... }: {
    xdg.configFile."nixpkgs/config.nix".source = ./nix-store/config.nix;
  };
}

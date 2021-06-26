{ config, lib, pkgs, ... }:

{
  options.chvp.eid.enable = lib.mkOption {
    default = false;
    example = true;
  };

  config = lib.mkIf config.chvp.eid.enable {
    environment.systemPackages = [ pkgs.eid-mw ];
    nixpkgs.overlays = [
      (self: super: {
        firefox = super.firefox.override { pkcs11Modules = [ self.eid-mw ]; };
      })
    ];
    services.pcscd = {
      enable = true;
      plugins = [ pkgs.ccid ];
    };
  };
}

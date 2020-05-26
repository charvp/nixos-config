{ ... }: {
  custom.zfs.homeLinks = [
    { path = ".ICAClient"; type = "data"; }
  ];
  home-manager.users.charlotte = { pkgs, ... }: {
    home.packages = with pkgs; [ citrix_workspace ];
  };
}
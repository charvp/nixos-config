{ config, lib, ... }:

{
  options.custom.gnupg.pinentryFlavor = lib.mkOption {
    type = lib.types.str;
    default = "curses";
    example = "qt";
    description = ''
      Pinentry flavor for gnupg.
    '';
  };

  config.custom.zfs.homeLinks = [
    { path = ".gnupg/crls.d"; type = "data"; }
    { path = ".gnupg/private-keys-v1.d"; type = "data"; }
    { path = ".gnupg/pubring.kbx"; type = "data"; }
    { path = ".gnupg/trustdb.gpg"; type = "data"; }
  ];
  config.programs.gnupg.agent.enable = true;
  config.home-manager.users.charlotte = { pkgs, ... }: {
    programs = {
      gpg.enable = true;
    };
    services.gpg-agent = {
      enable = true;
      defaultCacheTtl = 7200;
      maxCacheTtl = 99999;
      pinentryFlavor = config.custom.gnupg.pinentryFlavor;
    };
  };
}
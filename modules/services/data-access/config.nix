{ pkgs, ... }:

{
  users.users.data = {
    isNormalUser = true;
    home = "/home/data";
    description = "Data Access";
    uid = 1000;
    group = "users";
  };
  security.sudo.enable = false;
  services.openssh = {
    enable = true;
    permitRootLogin = "no";
    hostKeys = [
      { bits = 4096; path = "/run/secrets/ssh_host_rsa_key"; type = "rsa"; }
      { path = "/run/secrets/ssh_host_ed25519_key"; type = "ed25519"; }
    ];
  };
}

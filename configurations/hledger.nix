{ pkgs, ... }:

let
  hledger-repo = pkgs.fetchFromGitHub {
    owner = "chvp";
    repo = "hledger";
    rev = "feature/gain-reports";
    sha256 = "07qsrq71pnkys11q6k2zc20xc9l3yp8dhzp1ar5bnkgcwbm69rcx";
  };
in
{
  nixpkgs.overlays = [
    (self: super: {
      haskellPackages = super.haskellPackages.override {
        overrides = hself: hsuper: rec {
          hledger = hsuper.callCabal2nixWithOptions "hledger" hledger-repo "--subpath hledger" { };
          hledger-lib = hsuper.callCabal2nixWithOptions "hledger-lib" hledger-repo "--subpath hledger-lib" { };
        };
      };
    })
  ];
  home-manager.users.charlotte = { pkgs, ... }: {
    home.packages = [ pkgs.hledger ];
  };
}

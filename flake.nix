{
  description = "gsctl - The Giant Swarm CLI";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        gsctl = pkgs.callPackage ./packages/gsctl { inherit pkgs; };
      in
      rec {
        defaultPackage = gsctl;
        apps.gsctl = flake-utils.lib.mkApp { drv = gsctl; };
        defaultApp = apps.gsctl;
      }
    );
}

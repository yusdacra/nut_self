{
  description = "Flake for nut_self";

  inputs = {
    devshell.url = "github:numtide/devshell";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    naersk = {
      url = "github:nmattia/naersk";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flakeUtils.url = "github:numtide/flake-utils";
    nixpkgsMoz = {
      url = "github:mozilla/nixpkgs-mozilla";
      flake = false;
    };
  };

  outputs = inputs: with inputs;
    with flakeUtils.lib;
    eachSystem defaultSystems (system:
      let
        common = import ./nix/common.nix {
          sources = { inherit devshell naersk nixpkgs nixpkgsMoz; };
          inherit system;
        };

        packages = {
          # Compiles slower but has tests and faster executable
          "nut_self" = import ./nix/build.nix {
            inherit common;
            doCheck = true;
            release = true;
          };
          # Compiles faster but no tests and slower executable
          "nut_self-debug" = import ./nix/build.nix { inherit common; };
          # Compiles faster but has tests and slower executable
          "nut_self-tests" = import ./nix/build.nix { inherit common; doCheck = true; };
        };

      in
      {
        inherit packages;

        # Release build is the default package
        defaultPackage = packages."nut_self";



        devShell = import ./nix/devShell.nix { inherit common; };
      }
    );
}

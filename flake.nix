{
  inputs = {
    fenix.url = "github:nix-community/fenix";

    flake-parts.url = "github:hercules-ci/flake-parts";

    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { flake-parts, ... }@inputs:
    let
      inherit (flake-parts.lib) mkFlake;
    in
    mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      perSystem = { pkgs, inputs', ... }: {
        devShells.default = pkgs.callPackage ./dev-shell.nix {
          rust-toolchain_stable = inputs'.fenix.packages.stable.toolchain;
        };
      };
    };
}

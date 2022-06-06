{
  description = "A very basic flake";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = (nixpkgs.lib.attrValues self.overlays.${system});
        };
      in {
        overlays = { perl = import ./Rex.nix; };
        devShell = with pkgs;
          mkShell {
            packages = [ Rex ];
          };
      });
}

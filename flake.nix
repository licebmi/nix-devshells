{
  description = "A very basic flake";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: {
      overlays = {
        Rex = import ./Rex.nix;
        ansible = import ./ansible.nix;
        misc = import ./misc.nix;
      };
      devShells = {
        infrastructure = with self.nixpkgs.infrastructure;
          mkShell {
            packages =
              [ myScriptingPython Rex molecule ansible ansible-lint yamllint ];
          };
      };
      nixpkgs = {
        infrastructure = import nixpkgs {
          inherit system;
          overlays = with self.overlays; [ Rex ansible ];
        };
      };
    });
}

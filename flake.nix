{
  description = "Development projects flake";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: {
      devShells = {
        infrastructure = with self.packages.${system}.infrastructure;
          mkShell {
            packages =
              [ myScriptingPython Rex molecule ansible ansible-lint yamllint act ansible-doctor ];
          };
      };
      packages = {
        infrastructure = import nixpkgs {
          inherit system;
          overlays = with self.overlays; [ Rex ansible ];
        };
      };
    }) // {
      overlays = {
        Rex = import ./Rex.nix;
        ansible = import ./ansible.nix;
        misc = import ./misc.nix;
      };
    };
}

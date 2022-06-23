{
  description = "Development projects flake";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: {
      devShells = {
        infrastructure = with self.nixpkgs.${system}.infrastructure;
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
    }) // {
      overlays = {
        Rex = import ./Rex.nix;
        ansible = import ./ansible.nix;
        misc = import ./misc.nix;
      };
    };
}

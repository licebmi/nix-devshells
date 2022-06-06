final: prev:

let fetchFromGitHub = prev.fetchFromGitHub;
in {
  python = prev.python3.override {
    packageOverrides = final-python: prev-python: {
      cerberus = prev-python.cerberus.overridePythonAttrs (oldAttrs: rec {
        version = "1.3.2";
        src = fetchFromGitHub {
          owner = "pyeve";
          repo = "cerberus";
          rev = version;
          sha256 = "Kv9gzy6pj3p+ddx4R6mSjE0JwonmywwySwOTf3i90y8=";
        };
      });
      molecule = with final.python.pkgs;
        buildPythonPackage rec {
          pname = "molecule";
          version = "3.6.1";

          propagatedBuildInputs = [
            jsonschema
            ansible-compat
            cerberus
            click
            click-help-colors
            cookiecutter
            enrich
            jinja2
            packaging
            paramiko
            pluggy
            pyyaml
            rich
          ];

          format = "pyproject";

          src = fetchFromGitHub {
            owner = "ansible-community";
            repo = "molecule";
            rev = "v${version}";
            sha256 = "PAR7uw4t7cA8fq749jE4VmLODhrZXfccP9/kl5PR/8o=";
          };
        };
      molecule-vagrant = with final.python.pkgs;
        buildPythonPackage rec {
          pname = "molecule-vagrant";
          version = "1.0.0";
          src = fetchFromGitHub {
            owner = "ansible-community";
            repo = "molecule-vagrant";
            rev = "v${version}";
            sha256 = "HuIZsNaHYQLMXa67XnFhFnkhY6SVUN9y/s1EyOEVmwo=";
          };
          pythonPath = [ molecule pyyaml python-vagrant ];
          format = "pyproject";
          patchPhase = ''
            substituteInPlace setup.cfg \
              --replace "selinux" "" \
              --replace "molecule >= 3.4.1" "molecule"
          '';
        };
    };
  };
  myScriptingPython =
    prev.python3.withPackages (ps: [ ps.pyyaml ps.mergedeep ]);
  molecule = prev.python.toPythonApplication (final.python.pkgs.molecule);
  ansible = prev.ansible_2_13;
}

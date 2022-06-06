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
          format = "pyproject";
          SETUPTOOLS_SCM_PRETEND_VERSION = "v${version}";
          buildInputs = [ setuptools-scm ];

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
          format = "pyproject";
          SETUPTOOLS_SCM_PRETEND_VERSION = "v${version}";
          buildInputs = [ setuptools-scm jinja2 ];
          propagatedBuildInputs = [ molecule pyyaml python-vagrant ];

          src = fetchFromGitHub {
            owner = "ansible-community";
            repo = "molecule-vagrant";
            rev = "v${version}";
            sha256 = "HuIZsNaHYQLMXa67XnFhFnkhY6SVUN9y/s1EyOEVmwo=";
          };

          postPatch = ''
            substituteInPlace setup.cfg \
              --replace "selinux" "" \
              --replace "molecule >= 3.4.1" ""
            find molecule_vagrant/ -type f -exec echo include {} \; >> MANIFEST.in
          '';
        };
    };
  };
  myScriptingPython =
    prev.python3.withPackages (ps: [ ps.pyyaml ps.mergedeep ]);
  molecule = with final.python.pkgs;
    toPythonApplication (molecule.overridePythonAttrs (oldAttrs: {
      propagatedBuildInputs = oldAttrs.propagatedBuildInputs
        ++ [ python-vagrant molecule-vagrant ];
    }));
  ansible = with final.python.pkgs;
    toPythonApplication (ansible-core.overridePythonAttrs (oldAttrs: {
      propagatedBuildInputs = oldAttrs.propagatedBuildInputs
        ++ [ python-vagrant molecule-vagrant ];
    }));
}

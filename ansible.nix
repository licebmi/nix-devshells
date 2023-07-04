final: prev:

let fetchFromGitHub = prev.fetchFromGitHub;
in {
  python = prev.python3.override {
    packageOverrides = final-python: prev-python: rec {
      ansible-compat = prev-python.ansible-compat.overridePythonAttrs
        (oldAttrs: rec {
          pname = "ansible-compat";
          version = "3.0.2";
          src = prev-python.fetchPypi {
            inherit pname version;
            hash = "sha256-oQ6hkfnv4IWQ/2TLRqMa8fgULAhhjbGkvIJ+0lfGgjA=";
          };
        });

      molecule = with prev-python;
        buildPythonPackage rec {
          pname = "molecule";
          version = "5.0.1";
          format = "pyproject";
          SETUPTOOLS_SCM_PRETEND_VERSION = version;
          buildInputs = [ setuptools-scm ];
          propagatedBuildInputs = [ ansible-core final-python.ansible-compat ];

          postPatch = ''
            cat <<EOF > MANIFEST.in
            include LICENSE
            include README.md

            recursive-exclude * __pycache__
            recursive-exclude * *.py[co]

            recursive-include src/data *
            EOF
          '';

          pythonPath = [
            jinja2
            click
            click-help-colors
            pyyaml
            pluggy
            jsonschema
            enrich
            cookiecutter
            packaging
          ];

          src = fetchFromGitHub {
            owner = "ansible-community";
            repo = "molecule";
            rev = "v${version}";
            sha256 = "sha256-zdipn7pRO0azIE7vS+JR+V5sKL/eZaavRXaSXVjtFus=";
          };
        };

      molecule-plugins = with prev-python;
        buildPythonPackage rec {
          pname = "molecule-plugins";
          version = "23.4.1";
          format = "pyproject";
          SETUPTOOLS_SCM_PRETEND_VERSION = version;
          buildInputs = [ setuptools-scm ];
          propagatedBuildInputs = [ ansible-core final-python.ansible-compat ];

          pythonPath = [
            molecule
            pluggy
            click-help-colors
            enrich
            cookiecutter
            python-vagrant
          ];

          src = fetchFromGitHub {
            owner = "ansible-community";
            repo = "molecule-plugins";
            rev = "v${version}";
            sha256 = "sha256-qCUID7p89gO/u4OcWET1zLSJXl14IH/M8qBxMT46jH8=";
          };
          postPatch = ''
            cat <<EOF > MANIFEST.in
            include LICENSE
            include README.md

            recursive-exclude * __pycache__
            recursive-exclude * *.py[co]

            recursive-include src/molecule_plugins/*/cookiecutter **/*
            recursive-include src/molecule_plugins/*/modules **/*
            recursive-include src/molecule_plugins/*/playbooks **/*
            EOF
          '';
        };
    };
  };

  myScriptingPython =
    final.python3.withPackages (ps: [ ps.pyyaml ps.mergedeep ]);
  molecule = with final.python.pkgs;
    toPythonApplication (molecule.overridePythonAttrs (oldAttrs: {
      pythonPath = oldAttrs.pythonPath ++ [ molecule-plugins ];
    }));
  # ansible = with final.python.pkgs;
  #   toPythonApplication (ansible-core.overridePythonAttrs (oldAttrs: {
  #     propagatedBuildInputs = oldAttrs.propagatedBuildInputs
  #       ++ [ molecule molecule-plugins ];
  #   }));
}

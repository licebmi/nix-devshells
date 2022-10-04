final: prev:

with prev; {
  prettier = mkYarnPackage {
    name = "prettier";
    src = fetchFromGitHub {
      owner = "prettier";
      repo = "prettier";
      rev = "2.7.1";
      sha256 = "sha256-urvVl5/mSqXudqtNHmrgQrA/UClY0gmUfsXeESwQEEQ=";
    };
  };
  rpatool = runCommand {
    name = "rpatool";
    env = {
      src = fetchFromGitHub {
        owner = "Shizmob";
        repo = "rpatool";
        rev = "9a58396f9591021fc428968599bf671fcbb3da09";
        sha256 = "sha256-fSgcHC+zXn9jaaXHfNt2BhP9ouy2ac3rj2lt6TutXDo=";
      };
      nativeBuildInputs = [ gnused ];
    };
    runCommand = ''
      mkdir -p $out/bin
      cp $src/rpatool $out/bin/rpatool
      chmod +x $out/bin/rpatool
      sed -i '1c\#!${python3}/bin/python3' $out/bin/rpatool
    '';
  };
}

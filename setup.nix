{ pkgs ? import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs-channels/archive/76aafbf4bf4992c82da41ccefd8c6d481744524c.tar.gz";
    sha256 = "1xz8249i9yag4sxfzd5lkhqsyg7n6h3n2klb1cqqmcsav87f6x65";
  }) { overlays = []; }
, setup ? import (fetchTarball {
    url = "https://github.com/datakurre/setup.nix/archive/9f8529e003ea4d2f433d2999dc50b8938548e7d0.tar.gz";
    sha256 = "15qzhz28jvgkna5zv7pj0gfnd0vcvafpckxcp850j64z7761apnm";
 })
, python ? "python3"
, pythonPackages ? builtins.getAttr (python + "Packages") pkgs
, requirements ? ./. + "/requirements-${python}.nix"
}:

let overrides = self: super: {
  "flake8" = super."flake8".overrideDerivation(old: {
    patches = [];
  });
  "robotframework" = super."robotframework".overridePythonAttrs(old: {
    buildInputs = [ pkgs.unzip ];
  });
  "testfixtures" = super."testfixtures".overrideDerivation(old: {
    patches = [];
  });
# "docutils" = super."docutils".overrideDerivation(old: {
#   # patch name to tweak around bad archive at cachix
#   name = "${old.name}-2019-01-01";
# });
}; in

setup {
  inherit pkgs pythonPackages overrides requirements;
  src = ./.;
  propagatedBuildInputs = with pkgs; [
    geckodriver
    firefox
  ];
}

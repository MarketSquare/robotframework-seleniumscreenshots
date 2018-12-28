{ pkgs ? import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs-channels/archive/76aafbf4bf4992c82da41ccefd8c6d481744524c.tar.gz";
    sha256 = "1xz8249i9yag4sxfzd5lkhqsyg7n6h3n2klb1cqqmcsav87f6x65";
  }) { overlays = []; }
}:

let self = rec {

  # Update pythonPackages with setup.nix
  pythonPackages = (import ./setup.nix {
    inherit pkgs;
    python = "python3";
    pythonPackages = pkgs.python3Packages;
  }).pythonPackages;

  "robotframework-seleniumscreenshots" = (import ./setup.nix {
    inherit pkgs;
    python = "python3";
    pythonPackages = pkgs.python3Packages;
  }).build;

  # Build jupyter with robotkernel
  jupyter = pythonPackages.jupyter.overridePythonAttrs (old: {
    propagatedBuildInputs =
    with pythonPackages; old.propagatedBuildInputs ++ [
        jupyterlab
        # Packages available in the default Python kernel
        robotframework
        robotframework-seleniumlibrary
        robotframework-seleniumscreenshots
        robotkernel
    ];
  });

  # Configure Jupyter environment
  jupyter_config_dir = pkgs.stdenv.mkDerivation {
    name = "jupyter";
    builder = with pythonPackages; pkgs.writeText "builder.sh" ''
      source $stdenv/setup
      mkdir -p $out/share/jupyter/nbextensions
      mkdir -p $out/share/jupyter/migrated
      ${pythonPackages.python.withPackages (ps: with ps; [ robotkernel ])}/bin/python -m robotkernel.install --prefix=$out
      # in the future we might build JupyterLab configuration here
    '';
  };
};

in with self;

pkgs.stdenv.mkDerivation {
  name = "jupyter";
  buildInputs = [
    pkgs.firefox
    pkgs.geckodriver
    jupyter
    jupyter_config_dir
  ];
  shellHook = ''
    mkdir -p $PWD/.jupyter
    export JUPYTER_CONFIG_DIR=${jupyter_config_dir}/share/jupyter
    export JUPYTER_PATH=${jupyter_config_dir}/share/jupyter
    export JUPYTER_DATA_DIR=$PWD/.jupyter
    export JUPYTER_RUNTIME_DIR=$PWD/.jupyter
    export SSL_CERT_FILE=${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt
  '';
}

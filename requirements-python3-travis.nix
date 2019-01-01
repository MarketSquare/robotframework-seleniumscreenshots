# Generated by pip2nix 0.8.0.dev1
# See https://github.com/johbo/pip2nix

{ pkgs, fetchurl, fetchgit, fetchhg }:

self: super: {
  "atomicwrites" = super.buildPythonPackage {
    name = "atomicwrites-1.2.1";
    doCheck = false;
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/ac/ed/a311712ef6b4355035489f665e63e1a73f9eb371929e3c98e5efd451069e/atomicwrites-1.2.1.tar.gz";
      sha256 = "1vmkbw9j0qammwxbxycrs39gvdg4lc2d4lk98kwf8ag2manyi6pc";
    };
  };
  "attrs" = super.buildPythonPackage {
    name = "attrs-18.2.0";
    doCheck = false;
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/0f/9e/26b1d194aab960063b266170e53c39f73ea0d0d3f5ce23313e0ec8ee9bdf/attrs-18.2.0.tar.gz";
      sha256 = "0s9ydh058wmmf5v391pym877x4ahxg45dw6a0w4c7s5wgpigdjqh";
    };
  };
  "flake8" = super.buildPythonPackage {
    name = "flake8-3.6.0";
    doCheck = false;
    propagatedBuildInputs = [
      self."mccabe"
      self."pycodestyle"
      self."pyflakes"
      self."setuptools"
    ];
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/d0/27/c0d1274b86a8f71ec1a6e4d4c1cfe3b20d6f95b090ec7545320150952c93/flake8-3.6.0.tar.gz";
      sha256 = "0w0nprx22rbvrrkbfx9v5jc5gskbm08g219l7r8wai8zfswgadba";
    };
  };
  "flake8-blind-except" = super.buildPythonPackage {
    name = "flake8-blind-except-0.1.1";
    doCheck = false;
    propagatedBuildInputs = [
      self."setuptools"
    ];
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/ff/f2/ab635e6e420e78c94eab50cd3f53abd3ec27e411793e50b14f29edbb9f0b/flake8-blind-except-0.1.1.tar.gz";
      sha256 = "16g58mkr3fcn2vlfhp3rlahj93qswc7jd5qrqp748mc26dk3b8xc";
    };
  };
  "flake8-coding" = super.buildPythonPackage {
    name = "flake8-coding-1.3.1";
    doCheck = false;
    propagatedBuildInputs = [
      self."flake8"
    ];
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/f9/d7/889f7961ed549f15a280fa36edfc9b9016df38cd25cd0a8a7e4edc06efcf/flake8-coding-1.3.1.tar.gz";
      sha256 = "0i7qh5wmwh5bgf1lgi82nq2n6qks2jgv8pvr27dgw4c7q0i2p72l";
    };
  };
  "flake8-debugger" = super.buildPythonPackage {
    name = "flake8-debugger-3.1.0";
    doCheck = false;
    propagatedBuildInputs = [
      self."flake8"
      self."pycodestyle"
    ];
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/39/4b/90548607282483dd15f9ce1f4434d735ae756e16e1faf60621b0f8877fcc/flake8-debugger-3.1.0.tar.gz";
      sha256 = "15qxrb2d7sr0pf024fkknsx58aqa5iz38b9s0panv3zfwf6vhkxy";
    };
  };
  "flake8-isort" = super.buildPythonPackage {
    name = "flake8-isort-2.6.0";
    doCheck = false;
    propagatedBuildInputs = [
      self."flake8"
      self."isort"
      self."testfixtures"
    ];
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/85/fb/f2a33e47cf7520fd391e5f180cae5b8d2977ad7a5ddf897213137fe8a171/flake8-isort-2.6.0.tar.gz";
      sha256 = "0ajz616bif7sc02pm6fd41qs0n3dsx4lby5jrkfdpqynbm07q41w";
    };
  };
  "flake8-polyfill" = super.buildPythonPackage {
    name = "flake8-polyfill-1.0.2";
    doCheck = false;
    propagatedBuildInputs = [
      self."flake8"
    ];
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/e6/67/1c26634a770db5c442e361311bee73cb3a177adb2eb3f7af8953cfd9f553/flake8-polyfill-1.0.2.tar.gz";
      sha256 = "1nlf1mkqw856vi6782qcglqhaacb23khk9wkcgn55npnjxshhjz4";
    };
  };
  "flake8-quotes" = super.buildPythonPackage {
    name = "flake8-quotes-1.0.0";
    doCheck = false;
    propagatedBuildInputs = [
      self."flake8"
    ];
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/83/ff/0461010959158bb7d197691c696f1a85b20f2d3eea7aa23f73a8d07f30f3/flake8-quotes-1.0.0.tar.gz";
      sha256 = "09ib440hrf5bbsmdbqzbcpkkqqnqdwkaawbqz93bbwxwifnjg4gx";
    };
  };
  "isort" = super.buildPythonPackage {
    name = "isort-4.3.4";
    doCheck = false;
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/b1/de/a628d16fdba0d38cafb3d7e34d4830f2c9cb3881384ce5c08c44762e1846/isort-4.3.4.tar.gz";
      sha256 = "1y0yfv56cqyh9wyg7kxxv9y5wmfgcq18n7a49mp7xmzka2bhxi5r";
    };
  };
  "mccabe" = super.buildPythonPackage {
    name = "mccabe-0.6.1";
    doCheck = false;
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/06/18/fa675aa501e11d6d6ca0ae73a101b2f3571a565e0f7d38e062eec18a91ee/mccabe-0.6.1.tar.gz";
      sha256 = "07w3p1qm44hgxf3vvwz84kswpsx6s7kvaibzrsx5dzm0hli1i3fx";
    };
  };
  "more-itertools" = super.buildPythonPackage {
    name = "more-itertools-5.0.0";
    doCheck = false;
    propagatedBuildInputs = [
      self."six"
    ];
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/dd/26/30fc0d541d9fdf55faf5ba4b0fd68f81d5bd2447579224820ad525934178/more-itertools-5.0.0.tar.gz";
      sha256 = "1r12cm6mcdwdzz7d47a6g4l437xsvapdlgyhqay3i2nrlv03da9q";
    };
  };
  "pillow" = super.buildPythonPackage {
    name = "pillow-5.3.0";
    doCheck = false;
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/1b/e1/1118d60e9946e4e77872b69c58bc2f28448ec02c99a2ce456cd1a272c5fd/Pillow-5.3.0.tar.gz";
      sha256 = "14sgpkwccpkdnr9p1d1sw29ki3fdld4j773mibg4763psmy538rf";
    };
  };
  "pluggy" = super.buildPythonPackage {
    name = "pluggy-0.8.0";
    doCheck = false;
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/65/25/81d0de17cd00f8ca994a4e74e3c4baf7cd25072c0b831dad5c7d9d6138f8/pluggy-0.8.0.tar.gz";
      sha256 = "1580p47l2zqzsza8jcnw1h2wh3vvmygk6ly8bvi4w0g8j14sjys4";
    };
  };
  "py" = super.buildPythonPackage {
    name = "py-1.7.0";
    doCheck = false;
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/c7/fa/eb6dd513d9eb13436e110aaeef9a1703437a8efa466ce6bb2ff1d9217ac7/py-1.7.0.tar.gz";
      sha256 = "152nyjvd8phqbm9pwlnfx0xi4c6343hakjzg42sp4qw3k1qn74mz";
    };
  };
  "pycodestyle" = super.buildPythonPackage {
    name = "pycodestyle-2.4.0";
    doCheck = false;
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/28/ad/cae9654d7fd64eb3d2ab2c44c9bf8dc5bd4fb759625beab99532239aa6e8/pycodestyle-2.4.0.tar.gz";
      sha256 = "0fhy4vnlgpjq4qd1wdnl6pvdw7rah0ypmn8c9mkhz8clsndskz6b";
    };
  };
  "pyflakes" = super.buildPythonPackage {
    name = "pyflakes-2.0.0";
    doCheck = false;
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/92/9e/386c0d9deef14996eb90d9deebbcb9d3ceb70296840b09615cb61b2ae231/pyflakes-2.0.0.tar.gz";
      sha256 = "0jba28czyvimdc72llms3f17swp3i8jdcabf5w0j00adfbn64xls";
    };
  };
  "pytest" = super.buildPythonPackage {
    name = "pytest-4.0.2";
    doCheck = false;
    propagatedBuildInputs = [
      self."atomicwrites"
      self."attrs"
      self."more-itertools"
      self."pluggy"
      self."py"
      self."setuptools"
      self."six"
    ];
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/9d/a9/3688b67467527c25e7a4d02c3b22565f15158a0a5d681870bfda8af210c6/pytest-4.0.2.tar.gz";
      sha256 = "1sgq8nm7yb9ygapdjgn52zr0ny47gps5dpa86d08aiccq4pvz2gn";
    };
  };
  "pytest-runner" = super.buildPythonPackage {
    name = "pytest-runner-4.2";
    doCheck = false;
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/9e/b7/fe6e8f87f9a756fd06722216f1b6698ccba4d269eac6329d9f0c441d0f93/pytest-runner-4.2.tar.gz";
      sha256 = "1gkpyphawxz38ni1gdq1fmwyqcg02m7ypzqvv46z06crwdxi2gyj";
    };
  };
  "robotframework" = super.buildPythonPackage {
    name = "robotframework-3.1";
    doCheck = false;
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/dc/c9/34687fa751f6b3ad1a4b5b35f5ae1371b1c1b01e95007fbb03ac0732dc67/robotframework-3.1.zip";
      sha256 = "09r1rng8pngcfqmsnbl9d1dfvac2yx7zgjlym59zy0j4y70sb2xj";
    };
  };
  "robotframework-seleniumlibrary" = super.buildPythonPackage {
    name = "robotframework-seleniumlibrary-3.3.0";
    doCheck = false;
    propagatedBuildInputs = [
      self."robotframework"
      self."selenium"
    ];
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/ec/44/d6efee0ea0bff85cf5618327184f8342659d338f98e8f71e0deb04542f95/robotframework-seleniumlibrary-3.3.0.tar.gz";
      sha256 = "1yrqm9sjkc9zcy2djvdx3aqslvpwv3p15q5fizyljig0qif9inda";
    };
  };
  "selenium" = super.buildPythonPackage {
    name = "selenium-3.141.0";
    doCheck = false;
    propagatedBuildInputs = [
      self."urllib3"
    ];
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/ed/9c/9030520bf6ff0b4c98988448a93c04fcbd5b13cd9520074d8ed53569ccfe/selenium-3.141.0.tar.gz";
      sha256 = "039hf9knvl4s3hp21bzwsp1g5ri9gxsh504dp48lc6nr1av35byy";
    };
  };
  "setuptools" = super.buildPythonPackage {
    name = "setuptools-40.6.3";
    doCheck = false;
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/37/1b/b25507861991beeade31473868463dad0e58b1978c209de27384ae541b0b/setuptools-40.6.3.zip";
      sha256 = "1y085dnk574sxw9aymdng9gijvrsbw86hsv9hqnhv7y4d6nlsirv";
    };
  };
  "setuptools-scm" = super.buildPythonPackage {
    name = "setuptools-scm-3.1.0";
    doCheck = false;
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/09/b4/d148a70543b42ff3d81d57381f33104f32b91f970ad7873f463e75bf7453/setuptools_scm-3.1.0.tar.gz";
      sha256 = "0h4bglwfz8b9prqljv8z3w9rgydfyxzaj05bm1y6zs5m6shz548i";
    };
  };
  "six" = super.buildPythonPackage {
    name = "six-1.12.0";
    doCheck = false;
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/dd/bf/4138e7bfb757de47d1f4b6994648ec67a51efe58fa907c1e11e350cddfca/six-1.12.0.tar.gz";
      sha256 = "0wxs1q74v07ssjywbbm7x6h5v9qx209ld2yfsif4060sxi0h2sni";
    };
  };
  "testfixtures" = super.buildPythonPackage {
    name = "testfixtures-6.4.1";
    doCheck = false;
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/16/1c/0b694fbfd318e325888c3ac16776e9d1df452a90693d1d3734a5256fc793/testfixtures-6.4.1.tar.gz";
      sha256 = "0aa8jikyj2pl94b5i58ncs8dh44a53m66d3x2lprr04902gbah5h";
    };
  };
  "urllib3" = super.buildPythonPackage {
    name = "urllib3-1.24.1";
    doCheck = false;
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/b1/53/37d82ab391393565f2f831b8eedbffd57db5a718216f82f1a8b4d381a1c1/urllib3-1.24.1.tar.gz";
      sha256 = "08lwd9f3hqznyf32vnzwvp87pchx062nkbgyrf67rwlkgj0jk5fy";
    };
  };
}

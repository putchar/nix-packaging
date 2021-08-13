with import <nixpkgs> {};

python3Packages.buildPythonPackage rec {
  pname = "subprocess-tee";
  version = "0.3.2";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "01b0z8mcm568v9carhi0py1hs34wrbnlzyvdmhqzipql407kdpk2";
  };

  nativeBuildInputs = with python3Packages; [
    setuptools-scm
  ];

  checkInputs = with python3Packages; [
    pytestCheckHook
    enrich
  ];

  pythonImportsCheck = [
    "subprocess_tee"
  ];

  meta = with lib; {
    homepage = "https://github.com/pycontribs/subprocess-tee";
    description = "A subprocess.run drop-in replacement that supports a tee mode";
    license = licenses.mit;
    maintainers = with maintainers; [ putchar ];
  };
}

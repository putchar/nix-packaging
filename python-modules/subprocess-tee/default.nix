with import <nixpkgs> {};

python3Packages.buildPythonPackage rec {
  pname = "subprocess-tee";
  version = "0.3.2";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "01b0z8mcm568v9carhi0py1hs34wrbnlzyvdmhqzipql407kdpk2";
  };

  propagatedBuildInputs = with python3Packages; [
    setuptools-scm
  ];

  checkInputs = with python3Packages; [
    pytestCheckHook
    enrich
  ];

  checkPhase = ''
    pytest
  '';

  pythonImportsCheck = [
    "subprocess_tee"
  ];

  meta = with lib; {
    description = "Simple, easy-to-use throttler for asyncio";
    homepage = "https://github.com/hallazzang/asyncio-throttle";
    license = licenses.mit;
    maintainers = with maintainers; [ hexa ];
  };
}
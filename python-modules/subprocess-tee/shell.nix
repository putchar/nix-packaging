let
  pkgs = import (fetchTarball "https://github.com/putchar/nixpkgs/archive/python3-add-subprocess-tee.tar.gz") {};
in

pkgs.mkShell {
  name = "subprocess-tee";
  buildInputs = with pkgs.python3Packages; [
    python
    subprocess-tee
  ];
}

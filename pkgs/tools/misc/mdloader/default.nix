let
#  pkgs = import (fetchTarball "https://github.com/putchar/nixpkgs/archive/python3-add-subprocess-tee.tar.gz") {};
  pkgs = import <nixpkgs> {};
in

pkgs.stdenv.mkDerivation rec {
  pname = "mdloader";
  version = "1.0.5";

  src = pkgs.fetchFromGitHub {
    owner = "Massdrop";
    repo = "${pname}";
    rev = "${version}";
    sha256 = "sha256-vuoYxeNisU5bQbsNg3yUdGn2LmkxoNY15WH9cBFNt98=";
  };

  buildInputs = [
    pkgs.makeWrapper
  ];

  buildPhase = ''
    make
  '';

  installPhase = ''
    mkdir -p $out/bin
    mv ./build/mdloader $out/bin
    ### it feels wrong to put the file because we need to put this file where the keyboard.hex is
    mv ./applet-mdflash.bin $out/bin
  '';
}

{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "hello-world";
  version = "1.0.0";
  
  src = ./.;
  
  buildInputs = [ pkgs.gcc ];
  
  buildPhase = ''
    gcc -o hello hello.c
  '';
  
  installPhase = ''
    mkdir -p $out/bin
    cp hello $out/bin/
  '';
}
{ pkgs ? import <nixpkgs> {}}:

with pkgs;

let 
  djangoenv = callPackage ./djangoenv {}; 
  startdb = callPackage ./startdb {};
  nodejsenv = callPackage ./nodejsenv {};
in

pkgs.stdenv.mkDerivation {
  name = "django-shell";
  buildInputs = [
    startdb 
    djangoenv.buildInputs
    nodejsenv.buildInputs
  ];
}

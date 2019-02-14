{ pkgs ? import <nixpkgs> {}}:

with pkgs;

let 
  djangoenv = callPackage ./djangoenv.nix {}; 
  startdb = callPackage ./startdb.nix {};
in

pkgs.stdenv.mkDerivation {
  name = "django-shell";
  buildInputs = [startdb djangoenv.buildInputs];
}

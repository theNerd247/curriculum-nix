{ pkgs ? import <nixpkgs> {}}:

with pkgs;

let 
  djangoenv = callPackage ./djangoenv.nix {}; 
  startdb = callPackage ./startdb.nix {};
in

pkgs.stdenv.mkDerivation {
  name = "django-shell";
  buildInputs = [
    startdb 
    djangoenv.buildInputs
    nodePackages.node2nix
    nodePackages.create-react-app
    nodePackages.npm
  ];
}

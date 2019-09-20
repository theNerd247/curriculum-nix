{stdenv, djangoenv, startdb, nodejsenv}:

stdenv.mkDerivation {
  name = "gaenv";
  buildInputs = [
    startdb 
    djangoenv.buildInputs
    nodejsenv.buildInputs
  ];
}

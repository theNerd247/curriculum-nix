{stdenv, bash, postgresql}:

stdenv.mkDerivation {
  name = "startdb-1.0";
  buildInputs = [bash postgresql];
  src = ./src;

  installPhase = ''
    mkdir -p $out/bin
    cp $src/startdb.sh $out/bin/startdb
  '';
}

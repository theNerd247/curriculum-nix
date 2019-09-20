{stdenv, djangoenv}:

stdenv.mkDerivation 
rec {
  name = "django-intro-exercise";
  src  = ./.;
  buildInputs = [
    djangoenv.buildInputs
  ];
  installPhase = ''
    mkdir -p $out
    tar -vczf $out/${name}.tar.gz ./*
  '';
}

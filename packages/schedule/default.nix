{stdenv, nodejs, pandoc}:

stdenv.mkDerivation
{ name = "ga-scheduler";
  buildInputs = [ nodejs pandoc ];
  src = ~/src/org/generalassembly/sei-curriculum/schedule/
  installPhase = ''
    mkdir -p $out/bin
    cp -r bin/*.ics
  '';
}

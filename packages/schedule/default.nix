{stdenv, nodejs, pandoc}:

stdenv.mkDerivation
{ name = "ga-scheduler";
  buildInputs = [ nodejs pandoc ];
  src = ~/src/org/generalassembly/sei-curriculum/schedule;
  buildPhase = ''
    make clean
    make
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp -r bin/*.ics $out/bin
    cp -r bin/*.md $out/bin
    cp ./view $out/bin/view
  '';
}

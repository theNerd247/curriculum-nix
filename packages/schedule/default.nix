{stdenv, nodejs, pandoc}:

stdenv.mkDerivation
{ name = "ga-scheduler";
  buildInputs = [ nodejs pandoc ];
  src = ~/src/org/generalassembly/sei-curriculum/schedule/
  installPhase = ''
    mkdir -p $out/bin
    mv -r bin/*.ics $out/bin
    mv -r bin/*.md $out/bin
    mv view bin/
  '';
}

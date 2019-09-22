{stdenv, makeWrapper, nodejs, pandoc}:

stdenv.mkDerivation
{ name = "ga-scheduler";
  buildInputs = [ nodejs pandoc makeWrapper ];
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

  postFixup = ''
    wrapProgram $out/bin/view $wrapperFile --add-flags "-p /home/noah/org/generalassembly/sei-curriculum/ -d $out/bin/"
  '';
}

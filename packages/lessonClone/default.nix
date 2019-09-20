{ stdenv, git, bash}:

stdenv.mkDerivation 
{ name = "lessonClone";
  src=./.; 
  buildInputs = [ git bash ];
  installPhase = ''
    mkdir -p $out/bin
    mv ./lessonClone $out/bin
  '';
}

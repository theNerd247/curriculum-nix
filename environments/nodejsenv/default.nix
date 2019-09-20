{stdenv, nodejs, nodePackages}:

stdenv.mkDerivation
{ name = "nodejsenv";
  buildInputs = 
    [ nodejs
      nodePackages.create-react-app
      nodePackages.npm
    ];
}

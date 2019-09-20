let 
  config =
  {
    packageOverrides = pkgs:
    {
      djangoenv = pkgs.callPackage ./djangoenv {}; 
      startdb   = pkgs.callPackage ./startdb {};
      nodejsenv = pkgs.callPackage ./nodejsenv {};
    };
  };

  pkgs = import <nixpkgs> { inherit config; };
in

pkgs.callPackage ./. {}

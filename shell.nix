let 
  config =
  {
    packageOverrides = import ./default.nix; 
  };
in

import <nixpkgs> { inherit config; }

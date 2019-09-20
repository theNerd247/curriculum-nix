{callPackage, environments}:

{ test = callPackage ./test-lesson 
    { 
      inherit (environments) djangoenv;
    };
}

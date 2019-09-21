{callPackage, environments}:

callPackage ./out { inherit environments; inherit callPackage; }

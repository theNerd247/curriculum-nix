{callPackage, environments}:

callPackage ./out { callPackage = callPackage; inherit environments; }

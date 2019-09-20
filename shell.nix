let 
  config =
  {
    packageOverrides = pkgs:
      let
        makeLessonShell = drv: pkgs.mkShell 
          { buildInputs = [ drv ] ++ drv.buildInputs;
            shellHook = ''
              mkdir -p ${drv.name}
              tar -C ${drv.name} -zxf ${drv}/*.tar.gz 
            '';
          };
      in
      rec {
        djangoenv = pkgs.callPackage ./djangoenv {}; 
        startdb = pkgs.callPackage ./startdb {};
        nodejsenv = pkgs.callPackage ./nodejsenv {};
        lessonClone = pkgs.callPackage ./lessonClone {};
        test = makeLessonShell (pkgs.callPackage ./test-lesson {});
      };
  };
in

import <nixpkgs> { inherit config; }

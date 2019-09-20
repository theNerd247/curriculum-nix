let 
  config =
  {
    packageOverrides = pkgs:
      let
        makeLessonShell = drv: pkgs.mkShell 
          { buildInputs = [ drv ];
            shellHook = ''
              mkdir ${drv.name}
              tar -C ${drv.name} -zxvf ${drv}/*.tar.gz 
            '';
          };
      in
      rec {
        djangoenv = pkgs.callPackage ./djangoenv {}; 
        startdb = pkgs.callPackage ./startdb {};
        nodejsenv = pkgs.callPackage ./nodejsenv {};
        django-intro-exercise = pkgs.callPackage ./test-lesson {};
        lessonClone = pkgs.callPackage ./lessonClone {};
        test = makeLessonShell django-intro-exercise;
      };
  };
in

import <nixpkgs> { inherit config; }

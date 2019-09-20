let 
  config =
  {
    packageOverrides = pkgs:
      let
        makeLessonShell = name: drv: pkgs.mkShell 
          { buildInputs = [ drv ] ++ drv.buildInputs;
            shellHook = ''
              mkdir -p ${name}
              tar -C ${name} -zxf ${drv}/*.tar.gz 
            '';
          };
      in
      {
        generalAssembly = rec {
          packages = pkgs.callPackage ./packages {};
          environments = pkgs.callPackage ./environments { inherit packages; };
          lessons = pkgs.callPackage ./lessons { inherit environments; };
          shell = pkgs.lib.attrsets.mapAttrs makeLessonShell lessons;
        };
      };
  };
in

import <nixpkgs> { inherit config; }

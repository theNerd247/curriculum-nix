{callPackage}: 

{ 
  startdb = callPackage ./startdb {};
  lessonClone = callPackage ./lessonClone {};
  schedule = callPackage ./schedule {};
}

{callPackage, packages}: 

{ 
  djangoenv = callPackage ./djangoenv { inherit (packages) startdb; };
  nodejsenv = callPackage ./nodejsenv {};
}

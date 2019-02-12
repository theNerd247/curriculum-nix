{stdenv, python36, postgresql}:

let 
  py = python36.withPackages (ps: 
      with ps; 
      let 
        dj = django_2_1;
        rest = djangorestframework.override {django = dj; };
      in
        [dj psycopg2 rest]
    );
in

stdenv.mkDerivation {
  name = "djangoenv";
  buildInputs = [py postgresql];
}

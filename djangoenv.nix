{stdenv, python36, postgresql}:

let 
  py = python36.withPackages (ps: with ps; [django_2_1 psycopg2]);
in

stdenv.mkDerivation {
  name = "djangoenv";
  buildInputs = [py postgresql];
}

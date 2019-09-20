{stdenv, startdb, python36, postgresql}:

let 
  py = python36.withPackages (ps: 
      with ps; 
      let 
        dj = django_2_1;
        rest = djangorestframework.override { django = dj; };
        django-heroku = ps.callPackage ./django-heroku.nix { 
          licenses = stdenv.lib.licenses; 
          django = dj;
        };
      in
        [dj psycopg2 rest django-heroku whitenoise gunicorn ]
    );
in

stdenv.mkDerivation {
  name = "djangoenv";
  buildInputs = [py postgresql startdb];
}

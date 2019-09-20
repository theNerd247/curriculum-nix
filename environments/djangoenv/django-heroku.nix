{buildPythonPackage, licenses, fetchPypi, django, dj-database-url, whitenoise, gunicorn, twine, psycopg2}:

buildPythonPackage rec {
  version="0.3.1";
  pname="django-heroku";
  src =  fetchPypi {
    inherit pname version;
    sha256 = "6af4bc3ae4a9b55eaad6dbe5164918982d2762661aebc9f83d9fa49f6009514e";
  };

  doCheck = false;

  propagatedBuildInputs = [ django dj-database-url whitenoise gunicorn twine psycopg2 ];

  meta = {
    homepage = "https://github.com/heroku/django-heroku";
    description = "A Django library for Heroku apps.";
    license = licenses.bsd3;
  };
}

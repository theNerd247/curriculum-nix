#!/usr/bin/env bash
set -x

datadir=$(pwd)/data

echo "Enter database name: "

read dbname

if [[ -z $dbname ]]; then
  echo "database name cannot be empty!"
  exit 1
fi

dbuser="${dbname}user";

if [[ ! -d $datadir ]]; then
  echo "INIT POSTGRES DB UNDER $(whoami)"

  initdb -W $datadir\
    && pg_ctl -D $datadir -l logfile start \
    && echo "sleeping for 2 seconds for server to start"\
    && sleep 2\
    && psql postgres $(whoami) -e -c "CREATE DATABASE ${dbname};"\
    && psql postgres $(whoami) -e -c "CREATE USER ${dbuser} WITH PASSWORD '${dbname}';"\
    && psql postgres $(whoami) -e -c "GRANT ALL PRIVILEGES ON DATABASE ${dbname} TO ${dbuser};"
else
   pg_ctl -D $datadir -l logfile start
fi

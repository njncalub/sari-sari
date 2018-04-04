#!/bin/bash

testing[0]='test' || (echo 'Failure: arrays not supported in this version of bash.' && exit 2)

POSTGRES_ROOT_USER=postgres

function exec_psql()
{
    psql -c "$1" -U $POSTGRES_ROOT_USER
}

if [ -n "$POSTGRES_DB" ] && [ -n "$POSTGRES_USER" ] && [ -n "$POSTGRES_PASSWORD" ]; then
    cmdlist=(
        "CREATE DATABASE $POSTGRES_DB;"
        "CREATE USER $POSTGRES_USER WITH PASSWORD '$POSTGRES_PASSWORD';"
        "ALTER USER $POSTGRES_USER CREATEDB;"
        "ALTER ROLE $POSTGRES_USER SET client_encoding TO 'utf8';"
        "ALTER ROLE $POSTGRES_USER SET default_transaction_isolation TO 'read committed';"
        "ALTER ROLE $POSTGRES_USER SET timezone TO 'UTC';"
        "GRANT ALL PRIVILEGES ON DATABASE sarisari_db TO $POSTGRES_USER;"
    )
    
    index=0
    while [ "x${cmdlist[index]}" != "x" ]
    do
       index=$(( $index + 1 ))
       exec_psql "${cmdlist[index]}"
    done
    
else
    echo "Set required variables";
fi



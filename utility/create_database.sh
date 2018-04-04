#!/bin/bash

testing[0]='test' || (echo 'Failure: arrays not supported in this version of bash.' && exit 2)

POSTGRES_ROOT_USER=${1:-postgres}
POSTGRES_ROOT_TABLE=${2:-postgres}

function exec_psql()
{
    if [ -n "$1" ]; then
        echo "psql -d $POSTGRES_ROOT_TABLE -c \"$1\" -U $POSTGRES_ROOT_USER";
        psql -d $POSTGRES_ROOT_TABLE -c "$1" -U $POSTGRES_ROOT_USER
    fi
}

if [ -n "$POSTGRES_DB" ] && [ -n "$POSTGRES_USER" ] && [ -n "$POSTGRES_PASSWORD" ]; then
    cmdlist=(
        "CREATE DATABASE $POSTGRES_DB;"
        "CREATE USER $POSTGRES_USER WITH PASSWORD '$POSTGRES_PASSWORD';"
        "ALTER USER $POSTGRES_USER CREATEDB;"
        "ALTER ROLE $POSTGRES_USER SET client_encoding TO 'utf8';"
        "ALTER ROLE $POSTGRES_USER SET default_transaction_isolation TO 'read committed';"
        "ALTER ROLE $POSTGRES_USER SET timezone TO 'UTC';"
        "GRANT ALL PRIVILEGES ON DATABASE $POSTGRES_DB TO $POSTGRES_USER;"
    )
    
    for cmd in "${cmdlist[@]}"
    do
       exec_psql "$cmd"
    done
else
    echo "Set required environment variables";
fi



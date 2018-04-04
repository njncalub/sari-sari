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

if [ -n "$POSTGRES_DB" ] && [ -n "$POSTGRES_USER" ]; then
    cmdlist=(
        "DROP DATABASE $POSTGRES_DB;"
        "DROP USER $POSTGRES_USER;"
    )
    
    for cmd in "${cmdlist[@]}"
    do
       exec_psql "$cmd"
    done
else
    echo "Set required environment variables";
fi



#!/bin/bash

testing[0]='test' || (echo 'Failure: arrays not supported in this version of bash.' && exit 2)

POSTGRES_ROOT_USER=postgres

function exec_psql()
{
    psql -c "$1" -U $POSTGRES_ROOT_USER
}

if [ -n "$POSTGRES_DB" ] && [ -n "$POSTGRES_USER" ]; then
    cmdlist=(
        "DROP DATABASE $POSTGRES_DB;"
        "DROP USER $POSTGRES_USER;"
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



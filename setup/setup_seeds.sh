#! /bin/bash

filename=${1:-"*.sql"}

while read -r f; do
    PGPASSWORD=oa7szhIYHM3A psql --set ON_ERROR_STOP=1 -h ep-still-poetry-a4s5bv2z-pooler.us-east-1.aws.neon.tech -p 5432 -U default -d verceldb -f "$f" 1>/dev/null
    if [[ 0 -ne ${?} ]]; then
        exit 1
    fi
done < <(find setup/seeders -name "$filename" -mindepth 1 -maxdepth 1 | sort)

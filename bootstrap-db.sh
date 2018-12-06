#!/usr/bin/env bash

arn="arn:aws:secretsmanager:eu-west-1:221919672684:secret:bookshelf-db-master-nZhecc"

secret="$( aws --profile downer-scratch \
    --region eu-west-1 \
    secretsmanager get-secret-value \
    --secret-id "$arn" \
    | jq -r .SecretString )"

username="$( echo "${secret}" | jq -r .username )"
password="$( echo "${secret}" | jq -r .password )"
host="$( echo "${secret}" | jq -r .host )"
dbname="$( echo "${secret}" | jq -r .dbname )"

exec mysql --host="${host}" --user="${username}" --password="${password}"  --database="${dbname}"

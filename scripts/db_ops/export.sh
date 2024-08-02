#!/usr/bin/env bash

output_file="${REPO_ROOT}/database/test_data/dev_dataset.sql"

# don't clobber the existing file, just in case
if [ -f "$output_file" ]; then
    backup_file="${output_file}.backup"
    cp "$output_file" "$backup_file"
fi

# update the dataset used to populate the database in non-production environments
# by dumping its current state to a file
docker compose -f ./docker-compose.dev.yml exec db \
    /bin/bash -c 'pg_dump -a -U inflow -d inflow' > "$output_file"

#!/usr/bin/env sh

. "$(dirname "$0")/utils.sh"

ensure_docker_is_running

out_file="./database/test_data/dev_dataset.sql"

# update the dataset used to populate the database in non-production environments
# by dumping its current state to a file
docker compose -f "./docker-compose.dev.yml" exec db \
    /bin/bash -c 'pg_dump -a -U inflow -d inflow' > "$out_file"

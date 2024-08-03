#!/usr/bin/env sh

. "$(dirname "$0")/utils.sh"

out_file="./database/test_data/dev_dataset.sql"

ensure_docker_is_running

# update the dataset used to populate the database in non-production environments
# by dumping its current state to a file
echo "==> dumping database tables..."
docker compose -f compose.dev.yml exec db \
    /bin/bash -c 'pg_dump -a -U inflow -d inflow' > "$out_file"

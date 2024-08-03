#!/usr/bin/env sh

. "$(dirname "$0")/utils.sh"

REPO_ROOT=$(git rev-parse --show-toplevel)
out_file="${REPO_ROOT}/database/test_data/dev_dataset.sql"

ensure_docker_is_running

# update the dataset used to populate the database in non-production environments
# by dumping its current state to a file
docker compose -f "${REPO_ROOT}/docker-compose.dev.yml" exec db \
    /bin/bash -c 'pg_dump -a -U inflow -d inflow' > "$out_file"

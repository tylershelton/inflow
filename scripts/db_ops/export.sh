#!/usr/bin/env sh

REPO_ROOT=$(git rev-parse --show-toplevel)
out_file="${REPO_ROOT}/database/test_data/dev_dataset.sql"

# ensure docker is running
if ! docker info > /dev/null 2>&1; then
    echo "ERROR: Docker does not appear to be running. Please start the docker service and try again."
    exit 1
fi

# update the dataset used to populate the database in non-production environments
# by dumping its current state to a file
docker compose -f "${REPO_ROOT}/docker-compose.dev.yml" exec db \
    /bin/bash -c 'pg_dump -a -U inflow -d inflow' > "$out_file"

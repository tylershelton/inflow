#!/usr/bin/env sh

. "$(dirname "$0")/../utils.sh"

out_file="./database/test_data/dev_dataset.sql"

ensure_docker_is_running
docker_service_is_running db; db_was_running=$?

if [ "$db_was_running" -eq 1 ]; then
    echo "==> starting the \`db\` service container..."
    docker compose -f "$PROJECT_COMPOSE_FILE" up -d db > /dev/null 2>&1
fi

# update the dataset used to populate the database in non-production environments
# by dumping its current state to a file
echo "==> dumping database tables..."
docker compose -f "$PROJECT_COMPOSE_FILE" exec db \
    /bin/bash -c 'pg_dump -a -U inflow -d inflow' > "$out_file"

if [ "$db_was_running" -eq 1 ]; then
    echo "==> stopping \`db\` service container, as it was not running before export."
    docker compose -f "$PROJECT_COMPOSE_FILE" stop db > /dev/null 2>&1
fi

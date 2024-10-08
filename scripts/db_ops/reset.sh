#!/usr/bin/env sh

. "$(dirname "$0")/../utils.sh"

DB_VOLUME='inflow-dev_inflowdb'

ensure_docker_is_running

docker_service_is_running db; db_was_running=$?

if [ "$db_was_running" -eq 0 ]; then
    echo "==> Destroying the \`db\` service container..."
    docker compose -f "$PROJECT_COMPOSE_FILE" down db > /dev/null
fi

if docker volume ls -q | grep "^${DB_VOLUME}$" > /dev/null; then
    echo "==> Deleting the database volume..."
    docker volume rm "${DB_VOLUME}" > /dev/null
fi

if [ "$db_was_running" -eq 0 ]; then
    echo "==> Recreating the \`db\` service container..."
    docker compose -f "$PROJECT_COMPOSE_FILE" up db -d > /dev/null
    wait_for_postgres
fi

exit 0

#!/usr/bin/env sh

. "$(dirname "$0")/../utils.sh"

DB_VOLUME='inflow-dev_inflowdb'

ensure_docker_is_running

docker_service_is_running db; db_was_running=$?

if [ "$db_was_running" -eq 0 ]; then
    echo "==> stopping the \`db\` service container..."
    docker compose -f "$PROJECT_COMPOSE_FILE" stop db > /dev/null
fi

if docker volume ls -q | grep "^${DB_VOLUME}$"; then
    echo "==> deleting the database volume..."
    docker volume rm "${DB_VOLUME}" > /dev/null
fi

if [ "$db_was_running" -eq 0 ]; then
    echo "==> restarting \`db\` service container..."
    docker compose -f "$PROJECT_COMPOSE_FILE" start db > /dev/null
fi

exit 0

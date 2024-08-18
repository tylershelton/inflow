#!/usr/bin/env sh

. "$(dirname "$0")/../utils.sh"

ensure_docker_is_running

db_was_running=$(docker_service_is_running db)

if $db_was_running; then
    echo "==> stopping the \`db\` service container..."
    docker compose -f "$PROJECT_COMPOSE_FILE" stop db > /dev/null 2>&1
fi

echo "==> deleting the database volume..."
docker volume rm inflow-dev_inflowdb > /dev/null 2>&1

if $db_was_running; then
    echo "==> restarting \`db\` service container..."
    docker compose -f "$PROJECT_COMPOSE_FILE" start db > /dev/null 2>&1
fi

exit 0

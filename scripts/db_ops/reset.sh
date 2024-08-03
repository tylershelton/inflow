#!/usr/bin/env sh

. "$(dirname "$0")/utils.sh"

ensure_docker_is_running

db_was_running=$(docker_service_is_running db)

echo "==> stopping the \`db\` service container..."
docker compose -f compose.dev.yml stop db > /dev/null 2>&1

echo "==> deleting the \`db\` service container..."
docker compose -f compose.dev.yml rm -f db > /dev/null 2>&1

echo "==> deleting the database volume..."
docker volume rm inflow-dev_inflowdb > /dev/null 2>&1

echo "==> rebuilding/repopulating database..."
docker compose -f compose.dev.yml up -d db > /dev/null 2>&1

if ! $db_was_running; then
    echo "==> stopping \`db\` service container, as it was not running before reset."
    docker compose -f compose.dev.yml stop db > /dev/null 2>&1
fi

#!/usr/bin/env sh

. "$(dirname "$0")/utils.sh"

ensure_docker_is_running

docker compose -f compose.dev.yml stop db > /dev/null 2>&1
docker compose -f compose.dev.yml rm -f db > /dev/null 2>&1
docker volume rm inflow-dev_inflowdb > /dev/null 2>&1
docker compose -f compose.dev.yml up -d db > /dev/null 2>&1
docker compose -f ./docker-compose.dev.yml up -d

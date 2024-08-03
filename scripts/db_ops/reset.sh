#!/usr/bin/env sh

. "$(dirname "$0")/utils.sh"

ensure_docker_is_running

REPO_ROOT=$(git rev-parse --show-toplevel)
cd $REPO_ROOT

docker compose -f ./docker-compose.dev.yml stop db
docker compose -f ./docker-compose.dev.yml rm -f db
docker volume rm inflow-dev_inflowdb
docker compose -f ./docker-compose.dev.yml up -d

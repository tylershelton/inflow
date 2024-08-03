#!/usr/bin/env sh

# ensure docker is running
if ! docker info > /dev/null 2>&1; then
    echo "ERROR: Docker does not appear to be running. Please start the docker service and try again."
    exit 1
fi

REPO_ROOT=$(git rev-parse --show-toplevel)

cd $REPO_ROOT

docker compose -f ./docker-compose.dev.yml stop db
docker compose -f ./docker-compose.dev.yml rm -f db
docker volume rm inflow-dev_inflowdb
docker compose -f ./docker-compose.dev.yml up -d

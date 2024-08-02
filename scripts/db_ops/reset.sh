REPO_ROOT=$(git rev-parse --show-toplevel)

cd $REPO_ROOT

docker compose -f ./docker-compose.dev.yml stop db
docker compose -f ./docker-compose.dev.yml rm -f db
docker volume rm inflow-dev_inflowdb
docker compose -f ./docker-compose.dev.yml up -d

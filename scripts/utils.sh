#!/usr/bin/env sh

docker_service_is_running() {
    (
        service_name="$1"
        load_env || { echo "ERROR: Could not find .env file. Have you set up an environment with ./scripts/env?)" >&2; exit 1; }

        if docker compose -f "$PROJECT_COMPOSE_FILE" ps --services --filter "status=running" | grep -q "^${service_name}$"; then
            exit 0 # service is running
        fi
        exit 1 # service is not running
    )
    return $?
}

ensure_docker_is_running() {
    if ! docker info > /dev/null 2>&1; then
        echo "ERROR: Docker does not appear to be running. Please start the docker service and try again."
        exit 1
    fi
    return 0
}

exec_psql() {
    psql_cmd="psql --quiet --set CLIENT_MIN_MESSAGES=WARNING --set ON_ERROR_STOP=1 -U ${INFLOW_DB_USER} -d ${INFLOW_DB_NAME}"
    if [ $# -eq 0 ]; then
        output=$(
            docker compose -f "$PROJECT_COMPOSE_FILE" exec -T db \
                /bin/bash -c "$psql_cmd" 2>&1
        )
    else
        output=$(
            docker compose -f "$PROJECT_COMPOSE_FILE" exec db \
                /bin/bash -c "$psql_cmd \"$*\"" 2>&1
        )
    fi

    exit_status=$?

    if [ $exit_status -ne 0 ]; then
        echo "$output" >&2
        return $exit_status
    else
        echo "$output" | tail -n 1 # the sql result
        return 0
    fi
}

get_repo_root() {
    repo_root=$(git rev-parse --show-toplevel 2>/dev/null)
    if [ $? -eq 0 ]; then
        echo "$repo_root"
        return 0
    fi
    return 1
}

in_array() {
    (
        val="$1"
        arr="$2"
        for elem in $arr; do
            if [ "$elem" = "$val" ]; then
                exit 0
            fi
        done
        exit 1
    )
    return $?
}

load_env() {
    env_file="$(get_repo_root)/.env" || return 1
    if [ -f "$env_file" ]; then
        set -a
        . "$env_file"
        set +a
        return 0
    fi
    return 1
}

set_env_var() {
    (
        NAME="$1"
        VALUE="$2"
        ENV_FILE="$3"
        sed -i -e "s/^#\s*${NAME}=/${NAME}=/" -e "s/^${NAME}=.*/${NAME}=${VALUE}/" "$ENV_FILE"
        exit 0
    )
    return $?
}

wait_for_postgres() {
    (
        load_env || { echo "ERROR: Could not find .env file. Have you set up an environment with ./scripts/env?)" >&2; exit 1; }
        echo "==> Waiting for postgres to start..."
        while ! docker compose -f "$PROJECT_COMPOSE_FILE" exec db pg_isready -U "$INFLOW_DB_USER" > /dev/null; do
            sleep 1
        done
    )
}

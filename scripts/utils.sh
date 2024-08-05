#!/usr/bin/env sh

docker_service_is_running() {
    (
        service_name="$1"
        if docker compose -f compose.dev.yml ps --services --filter "status=running" | grep -q "^${service_name}$"; then
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

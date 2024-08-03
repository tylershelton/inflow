ensure_docker_is_running() {
    if ! docker info > /dev/null 2>&1; then
        echo "ERROR: Docker does not appear to be running. Please start the docker service and try again."
        exit 1
    fi
    return 0
}

docker_service_is_running() {
    local service_name="$1"
    if docker compose -f compose.dev.yml ps --services --filter "status=running" | grep -q "^${service_name}$"; then
        return 0 # service is running
    fi
    return 1 # service is not running
}

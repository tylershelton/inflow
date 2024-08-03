ensure_docker_is_running() {
    if ! docker info > /dev/null 2>&1; then
        echo "ERROR: Docker does not appear to be running. Please start the docker service and try again."
        exit 1
    fi
    return 0
}

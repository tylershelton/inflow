#!/usr/bin/env pwsh

# Get the root of the git repository
$REPO_ROOT = & git rev-parse --show-toplevel

# Ensure the output directory exists
$devDatasetPath = Join-Path -Path $REPO_ROOT -ChildPath "database/test_data/dev_dataset.sql"
$devDatasetDir = Split-Path -Path $devDatasetPath -Parent

if (-not (Test-Path -Path $devDatasetDir)) {
    New-Item -ItemType Directory -Path $devDatasetDir -Force
}

# Update the dataset used to populate the database in non-production environments
# by dumping its current state to a file
docker compose -f .\docker-compose.dev.yml exec db /bin/bash -c 'pg_dump -a -U inflow -d inflow' | Out-File -FilePath $devDatasetPath -Encoding ASCII

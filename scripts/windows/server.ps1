#!/usr/bin/env pwsh

function cmd_is_valid {
    param ($cmd)
    $valid_cmds = @("up", "down")
    return $valid_cmds -contains $cmd
}

if (-not $args[0]) {
    Write-Output "Usage: server (up|down)"
    exit 1
}

# Store the original directory
$originalDir = Get-Location

# Get the root of the git repository
$REPO_ROOT = & git rev-parse --show-toplevel
$ENV = Get-Content -Path (Join-Path -Path (Split-Path -Parent $MyInvocation.MyCommand.Path) -ChildPath "..\.env") -Raw
$cmd = $args[0]

Set-Location -Path $REPO_ROOT

# Start servers
if ($cmd -eq "up") {
    if ($ENV.Trim() -eq "production") {
        & "$(Split-Path -Parent $MyInvocation.MyCommand.Path)\setup.ps1"
        docker compose -f docker-compose.yml up --build -d
    } else {
        # Start in dev mode by default
        $env:DEV_HOST_ENV = "windows"; docker compose -f docker-compose.dev.yml up --build -d
        docker compose -f docker-compose.dev.yml exec inflow bash
    }
} elseif ($cmd -eq "down") {
    if ($ENV.Trim() -eq "production") {
        docker compose -f docker-compose.yml down
    } else {
        # Start in dev mode by default
        docker compose -f docker-compose.dev.yml down
    }
}

# Change back to the original directory
Set-Location -Path $originalDir

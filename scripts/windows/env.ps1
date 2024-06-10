#!/usr/bin/env pwsh

# Store the original directory
$originalDir = Get-Location

# Change directory to the script's location
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Path)

$supported_envs = @("production", "development")
$env_file = "..\.env"

function env_exists {
    param ($new_env)
    foreach ($env in $supported_envs) {
        if ($env -eq $new_env) {
            return $true
        }
    }
    return $false
}

function print_envs {
    Write-Output "This project supports the following environments:"
    foreach ($env in $supported_envs) {
        Write-Output "  $env"
    }
}

# Handle runs with no argument provided
if (-not $args) {
    if (Test-Path -Path $env_file) {
        Get-Content -Path $env_file
        # Change back to the original directory
        Set-Location -Path $originalDir
        exit 0
    } else {
        Write-Output "No environment set."
        print_envs
        # Change back to the original directory
        Set-Location -Path $originalDir
        exit 1
    }
}

# Handle runs with an argument provided
$new_env = $args[0]
if (env_exists -new_env $new_env) {
    Set-Content -Path $env_file -Value $new_env
    Write-Output "Setting environment to '$new_env'."
    # Change back to the original directory
    Set-Location -Path $originalDir
    exit 0
} else {
    Write-Output "Unknown environment '$new_env'."
    print_envs
    # Change back to the original directory
    Set-Location -Path $originalDir
    exit 1
}

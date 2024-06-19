#!/usr/bin/env pwsh

# Store the original directory
$originalDir = Get-Location

# Get the root of the git repository
$REPO_ROOT = & git rev-parse --show-toplevel

# Clean up webpack artifacts
if (Test-Path -Path "$REPO_ROOT/build" -PathType Container) {
    Write-Output '==> cleaning up webpack build artifacts...'
    Remove-Item -Recurse -Force "$REPO_ROOT/build"
}

# Clean up node_modules
if (Test-Path -Path "$REPO_ROOT/node_modules" -PathType Container) {
    Write-Output '==> removing node_modules...'
    Remove-Item -Recurse -Force "$REPO_ROOT/node_modules"
}

# Clean up environment info
if (Test-Path -Path "$REPO_ROOT/scripts/.env" -PathType Leaf) {
    Write-Output '==> clearing environment settings...'
    Remove-Item -Force "$REPO_ROOT/scripts/.env"
}

# Change back to the original directory
Set-Location -Path $originalDir

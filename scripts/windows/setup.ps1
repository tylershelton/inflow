# scripts/setup.ps1: Set up application for the first time after cloning, or set it
#                    back to the initial first unused state.

# Execute the bootstrap script
& "$(Split-Path -Parent $MyInvocation.MyCommand.Path)\bootstrap.ps1"

Set-Location -Path (git rev-parse --show-toplevel)

# Build webpack artifacts

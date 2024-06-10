# scripts/setup.ps1: Set up application for the first time after cloning, or set it
#                    back to the initial first unused state.

# Execute the bootstrap script
# & "$(Split-Path -Parent $MyInvocation.MyCommand.Path)\bootstrap.ps1"
$originalDir = Get-Location

Set-Location -Path (git rev-parse --show-toplevel)

# Build webpack artifacts
docker build --quiet -t inflow-dev:latest -f .\Dockerfile.dev .
# addition of -it here preserves STDOUT colors by convincing the
# process it's running in an interactive shell (even though we bin
# the container immediately upon completion)
docker run --rm -it `
    -v .:/usr/src/app `
    -v /usr/src/app/node_modules `
    inflow-dev npm run build

Set-Location -Path $originalDir

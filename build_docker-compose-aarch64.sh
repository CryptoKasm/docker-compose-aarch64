#!/bin/bash

# Build docker-compose via Dockerfile
buildDockerFile() {
    docker build . -t docker-compose-aarch64-builder
}

# Cleanup build files
cleanDockerBuild() {
    docker run --rm -v "$(pwd)":/dist docker-compose-aarch64-builder
}

# Set Perms 
setPerms() {
    if [ -f docker-compose-Linux-aarch64 ]; then sudo chown $USER:$USER docker-compose-Linux-aarch64 && chmod +x docker-compose-Linux-aarch64; fi
    if [ -f docker-compose-entrypoint.sh ]; then sudo chown $USER:$USER docker-compose-entrypoint.sh && chmod +xrw docker-compose-entrypoint.sh; fi
}

buildDockerFile
cleanDockerBuild
setPerms
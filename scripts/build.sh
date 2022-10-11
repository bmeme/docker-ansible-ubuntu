#!/bin/bash

## Simple script to build images
# Usage:
# $ scripts/build.sh [OS_MAJOR] [OS_MINOR_VERSION]
#
# where:
# OS_MAJOR: major version of Ubuntu ex: focal
# OS_MINOR_VERSION: minor version of Ubuntu ex: 20220922

set -o errexit
set -o nounset
set -o pipefail
#set -o xtrace # Uncomment this line for debugging purpose

# Arguments
OS_MAJOR=$1

# Variables
DOCKERFILE="${OS_MAJOR}/Dockerfile"
FROM=$(head -1 "${DOCKERFILE}" | awk -F: '{print $2}')
CODENAME=$(echo "${FROM}" | awk -F- '{print $1}' )
BUILDDATE=$(echo "${FROM}" | awk -F- '{print $2}' )
LATEST=$(cat .latest)

docker build -f ${OS_MAJOR}/Dockerfile \
  -t bmeme/docker-ansible-ubuntu:"${OS_MAJOR}" \
  -t bmeme/docker-ansible-ubuntu:"${CODENAME}" \
  -t bmeme/docker-ansible-ubuntu:"${FROM}" .

if [[ ${FROM} == "${LATEST}" ]]; then
    docker build -f ${OS_MAJOR}/Dockerfile \
      -t bmeme/docker-ansible-ubuntu:latest .
fi
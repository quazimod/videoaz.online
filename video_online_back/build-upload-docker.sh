#!/usr/bin/env bash
ABSOLUTE_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "${ABSOLUTE_PATH}" || exit
echo $PWD

# config
DOCKER_LOCAL_REPOSITORY="video-online-back"
DOCKER_REMOTE_REPOSITORY="503148106670.dkr.ecr.eu-central-1.amazonaws.com/video-online-back"
# @end config

set -e

if [[ -z "${DOCKER_LOCAL_REPOSITORY}" ]]; then
  printf "\e[1;91mERROR\e[0m: DOCKER_LOCAL_REPOSITORY is not set\n"
  exit 1
fi

GIT_COMMIT_SHORTHASH=${CI_COMMIT_SHORT_SHA:-$(git rev-parse --short=8 HEAD)}

echo ${GIT_COMMIT_SHORTHASH}

DOCKER_IMAGE_VERSION="${GIT_COMMIT_SHORTHASH}"

printf "> \e[1;37mBuilding docker\e[0m\n"

printf "\n> \e[1;37mBuilding Docker image\e[0m\n"
printf "# Image \e[1;37m%s\e[0m\n\n" "${DOCKER_LOCAL_REPOSITORY}"

docker build \
  --pull \
  -t ${DOCKER_LOCAL_REPOSITORY}:"${DOCKER_IMAGE_VERSION}" \
  -t ${DOCKER_LOCAL_REPOSITORY}:latest .

if [[ ${PUSH_TO_ECR} == "true" ]]; then
  printf "\n> \e[93m\033[1mUploading Docker image\e[0m\n\n"

  docker tag ${DOCKER_LOCAL_REPOSITORY}:"${DOCKER_IMAGE_VERSION}" "${DOCKER_REMOTE_REPOSITORY}":"${DOCKER_IMAGE_VERSION}"

  printf "# Uploading to %s:%s\n" "${DOCKER_REMOTE_REPOSITORY}" "${DOCKER_IMAGE_VERSION}"
  docker push "${DOCKER_REMOTE_REPOSITORY}":"${DOCKER_IMAGE_VERSION}"
fi
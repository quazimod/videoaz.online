#!/usr/bin/env bash
ABSOLUTE_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "${ABSOLUTE_PATH}" || exit

printf "\n> \e[93m\033[1mDeploying video-online-front\e[0m\n\n"

set -e

die() {
  echo
  echo "$*"
  echo
  exit 1
}

############################
# prepare basic parameters #
############################

ENVIRONMENT=${1}
APP_VERSION=${2}
HELM_APP_NAME="video-online-front-${ENVIRONMENT}"
CHART_DIRECTORY="video-online-front"
VALUES_FILE="./env/${ENVIRONMENT}.yaml"
NAMESPACE="video-online-front-${ENVIRONMENT}"

if [[ -z "${APP_VERSION}" ]]; then
  APP_VERSION=${CI_COMMIT_SHORT_SHA:-$(git rev-parse --short=8 HEAD)}
fi

TEMP_CHART_DIRECTORY="/var/tmp/${CHART_DIRECTORY}-${APP_VERSION}"

echo "APP_VERSION: ${APP_VERSION}"
echo "HELM_APP_NAME: ${HELM_APP_NAME}"
echo "ENVIRONMENT: ${ENVIRONMENT}"
echo ""

if [[ ! -f "${VALUES_FILE}" ]]; then
  die "ERROR: Not found values file for ${NAMESPACE} "
fi

set -eou pipefail

######################
# prepare Helm chart #
######################

rm -rf ${TEMP_CHART_DIRECTORY}
cp -R ${CHART_DIRECTORY} ${TEMP_CHART_DIRECTORY}
APP_VERSION=${APP_VERSION} gomplate -f ${TEMP_CHART_DIRECTORY}/Chart.yaml -o ${TEMP_CHART_DIRECTORY}/Chart.yaml

###########
# dry-run #
###########

printf "> \e[1;37mDry-Run\e[0m\n\n"

set +e
kubectl create namespace ${NAMESPACE}
set -e

kubens ${NAMESPACE}

EXISTING_RELEASE=$(helm list -n ${NAMESPACE} -q -f ${HELM_APP_NAME})

echo EXISTING_RELEASE=${EXISTING_RELEASE}
echo ""

helm_deploy_cmd="helm upgrade --install ${HELM_APP_NAME} ${TEMP_CHART_DIRECTORY} -f ${VALUES_FILE} --history-max 10 --debug -n ${NAMESPACE}"

helm_deploy_dry_run_cmd="${helm_deploy_cmd} --dry-run"
echo "> ${helm_deploy_dry_run_cmd}"
eval ${helm_deploy_dry_run_cmd}

##########
# deploy #
##########

printf "> \e[1;37mDeploying\e[0m\n\n"

echo "> ${helm_deploy_cmd}"
eval ${helm_deploy_cmd}

################
# track status #
################

printf "> \e[1;37mTrack Deployment\e[0m\n\n"


cat <<EOF | kubedog multitrack
{
  "Deployments": [
    {
      "ResourceName": "${HELM_APP_NAME}",
      "Namespace": "${NAMESPACE}"
    }
  ]
}
EOF
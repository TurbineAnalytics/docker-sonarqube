#!/bin/bash

set -euo pipefail

docker build -t turbineanalytics/sonarqube:6.4-alpine 6.4-alpine

docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
docker push turbineanalytics/sonarqube:6.4-alpine

#!/bin/bash

if ! [[ $(pwd) =~ /graphql-demo$ ]]; then
  echo "ERROR: Wrong directory. Please change directory to /graphql-demo and try again"
  exit 1
fi

set -e

docker-compose -f docker/docker-compose.yml -f docker/docker-compose.development.yml -p graphqldevelopment run --rm --entrypoint=/bin/bash rails -c "$@"

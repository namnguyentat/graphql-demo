#!/bin/bash

if ! [[ $(pwd) =~ /graphql-demo$ ]]; then
  echo "ERROR: Wrong directory. Please change directory to /graphql-demo and try again"
  exit 1
fi

set -e

script/docker/stop.sh
script/docker/start.sh

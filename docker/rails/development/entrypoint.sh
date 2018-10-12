#!/bin/bash
set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

script/docker/wait_for_it.sh mariadb:3306 \
  && exec bundle exec "$@"

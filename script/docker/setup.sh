#!/bin/bash

if ! [[ $(pwd) =~ /graphql-demo$ ]]; then
  echo "ERROR: Wrong directory. Please change directory to /graphql-demo and try again"
  exit 1
fi

set -e

docker-compose -f docker/docker-compose.yml -f docker/docker-compose.development.yml -p graphqldevelopment build

docker network inspect graphql-demo-development > /dev/null 2>&1 || docker network create --driver=bridge --subnet=172.10.200.0/24 graphql-demo-development

docker-compose -f docker/docker-compose.yml -f docker/docker-compose.development.yml -p graphqldevelopment run --rm --entrypoint=/bin/bash rails -c \
  "yarn install && bundle install"

docker-compose -f docker/docker-compose.yml -f docker/docker-compose.development.yml -p graphqldevelopment run --rm --entrypoint=/bin/bash rails -c \
  "script/docker/wait_for_it.sh mariadb:3306 -- bundle exec rake db:drop db:create db:migrate db:seed db:fake"

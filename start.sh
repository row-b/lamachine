#!/usr/bin/env bash

ECHO_OUTPUT=./scripts/write-output.sh
ECHO_ERROR_OUTPUT=./scripts/write-error-output.sh

usage()
{
    echo "
Usage: ./start.sh [COMMAND]

COMMAND:
    build                          Builds the container(s)
    up                             Brings the docker container(s) up
    down                           Brings the docker container(s) down"
    exit
}

build()
{
    bash $ECHO_OUTPUT "Start docker container(s)"
    docker-compose -f ./docker-compose.yml up -d --build
}

up()
{
    bash $ECHO_OUTPUT "Start docker container(s)"
    docker-compose -f ./docker-compose.yml up -d
}

down()
{
    bash $ECHO_OUTPUT "Bring down docker container(s)"
    docker-compose -f ./docker-compose.yml down
}

shell()
{
    docker exec -it lamachine bash
}

case $1 in
    build )              build
    ;;
    up )                 up
    ;;
    down )               down
    ;;
    shell )             shell
    ;;
    help | * )          usage
    ;;
esac

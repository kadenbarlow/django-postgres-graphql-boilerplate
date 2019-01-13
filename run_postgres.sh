#!/usr/local/bin/

PASSWORD=docker
PORTS=5432:5432
VOLUME=postgres:/var/lib/postgresql/data
CONTAINER=postgres
NAME=app

docker pull postgres
docker run --rm --name $CONTAINER -e POSTGRES_PASSWORD=$PASSWORD -e POSTGRES_DB=$NAME -d -p $PORTS -v $VOLUME  postgres
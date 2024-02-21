# RESTAURANT API

### folders

- db: code to interact with the database
- handler: handle the API routes using chi
- models: contains GO structs to bound them into the database objects or transformed into the JSON equivalent
- Dockerfile: defines the base image and commands erquiree to have our API serer up adn running. The docker-compose.yml define our app dependencies(the servers using the Dockerfile and the databse usin the official psotgres docker image).
- .env: environment variables
- main.go: application entry point

### Requirements
- Docker
- Go

### Usage

clone the repository with:
```
git clone github.com/abezzi/delta-restaurant-api.git
```

rename the .env-example into .env
```
mv .env-example .env
```

update the postgres variables declared in the new .env to match your preferences. There's a handy guide on the [postgres dockerhub](https://hub.docker.com/_/postgres) 

Build and start the service with:
```
docker-compose up --build
```

Run the migrations:
```
export POSTGRESQL_URL="postgres://$PG_USER:$PG_PASS@localhost:5432/$PG_DB?sslmode=disable"
migrate -database ${POSTGRESQL_URL} -path db/migrations up
```

*NOTE:* replace the $PG with the actual values

### Development
After making a change run the following commands:

```
docker-compose stop server
docker-compose build server
docker-compose up --no-start server
docker-compose start server
```

# RESTAURANT API

### folders

- db: code to interact with the database
- handler: handle the API routes using chi
- models: contains GO structs to bound them into the database objects or transformed into the JSON equivalent
- Dockerfile: defines the base image and commands erquiree to have our API serer up adn running. The docker-compose.yml define our app dependencies(the servers using the Dockerfile and the databse usin the official psotgres docker image).
- .env: environment variables
- main.go: application entry point


default:
	@echo "This is a work in progress..."

container-build: docker-compose.yaml ./docker/*
	docker-compose down
	docker-compose build

app-build:
	docker-compose stop
	docker-compose run kitura swift build

app-run:
	docker-compose exec kitura swift run

up: container-build
	docker-compose up
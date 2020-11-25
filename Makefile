
default:
	@echo "This is a work in progress..."

container-build: docker-compose.yaml ./docker/*
	${MAKE} log/container_build.log

log/container_build.log:  docker-compose.yaml ./docker/*
	docker-compose down
	mkdir -p log
	touch log/container_build.log
	docker-compose build | tee log/container_build.log

kitura-shell:
	${MAKE} start
	docker-compose exec kitura bash

app-build: ${wildcard ./app/Sources/*}
	${MAKE} start
	docker-compose exec kitura swift build

app-run: app-build
	${MAKE} start
	docker-compose exec kitura swift run

start: container-build
	docker-compose up -d



stop:
	docker-compose stop
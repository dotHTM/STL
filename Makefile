
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
	docker-compose exec -T kitura bash

app-build: ${wildcard ./app/Sources/*}
	${MAKE} start
	docker-compose exec -T kitura swift build

app-run: app-build
	${MAKE} stop
	${MAKE} up

start: container-build
	docker-compose up -d

logs:
	docker-compose logs -f

monitor:
	docker_monitor.sh

up:
	${MAKE} start logs

stop:
	docker-compose stop
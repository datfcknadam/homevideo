env=.env
docker_bin=docker-compose.yml
docker_dev_bin=docker-compose-dev.yml

up-service:
	docker-compose -f ${docker_bin} --env-file ${env} up -d

up-dev-service: 
	docker-compose -f ${docker_bin} -f ${docker_dev_bin} --env-file ${env} up -d

build-dev-service: 
	docker-compose -f ${docker_bin} -f ${docker_dev_bin} --env-file ${env} build

up: up-service

build-nginx:
	docker-compose --env-file ${env} build nginx

up-nginx:
	docker-compose --env-file ${env} up -d nginx
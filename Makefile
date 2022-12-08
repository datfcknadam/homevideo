env=.env

dev-front:
	cd frontend && npm start

up-service:
	docker-compose --env-file ${env} up -d

up: up-service dev-front

build-nginx:
	docker-compose --env-file ${env} build nginx

up-nginx:
	docker-compose --env-file ${env} up -d nginx

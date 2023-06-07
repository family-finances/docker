-include .env

help:
	@make --help

# server

init: config download up

config:
	@cp .env.example .env

download:
	@git clone ${FRONTEND_GIT} frontend

up:
	@docker compose up --build --force-recreate -d

down:
	@docker compose down --remove-orphans

restart: down up

# connections

shell-frontend:
	@docker compose exec --user node frontend /bin/sh

PHONY: help

help:
	@echo ""
	@echo "# PROJECT"
	@echo "build     build database and server containers"
	@echo "run       run project in background"
	@echo "log       log only server"
	@echo "log-all   log server and database"


build:
	@docker-compose build

run:
	@docker-compose up -d

down:
	@docker-compose down

log:
	@docker-compose logs -f web

log-all:
	@docker-compose logs -f web
PHONY: help

help:
	@echo ""
	@echo "# PROJECT"
	@echo "build     build database and server containers"
	@echo "run       run project in background"
	@echo "log       log only server"
	@echo "log-all   log server and database"
	@echo "in        get into server's shell"
	@echo ""
	@echo "# DJANGO"
	@echo "req       update requirements following requirements.txt"


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

req:
	@docker-compose run web pip install -r requirements.txt

in:
	@docker-compose run web /bin/sh
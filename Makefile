######################################
##       MAKEFILE FOR PROJECT       ##
######################################

.SILENT:
.PHONY: build

COMPOSE_CMD = docker-compose


#####
## Executed when you run "make" cmd
## Simply run "help" tasks
all: help


#####
## Build images (and ensure they are up to date)
build:
	@echo 'Pull & build required images'
	$(COMPOSE_CMD) build


#####
## Start new bash terminal inside the avm container
ssh:
	@echo 'Starting new bash terminal inside avm container'
	$(COMPOSE_CMD) run --rm avm bash


#####
## Display current running containers logs
logs:
	@echo 'Display containers Logs (Press "Ctrl + c" to exit)'
	$(COMPOSE_CMD) logs -f


#####
## Display available make tasks
help:
	@echo 'Recipes List:'
	@echo ''
	@echo 'make <recipes>'
	@echo ''
	@echo '+-----------------+--------------------------------------------------------------------+'
	@echo '| Recipes         | Utility                                                            |'
	@echo '+-----------------+--------------------------------------------------------------------+'
	@echo '| build           | Build images (and ensure they are up to date)                      |'
	@echo '| ssh             | Start new bash terminal inside the Symfony Container               |'
	@echo '| logs            | Display current running containers logs (Press "Ctrl + c" to exit) |'
	@echo '+-----------------+--------------------------------------------------------------------+'
	@echo ''

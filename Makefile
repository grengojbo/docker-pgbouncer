IMAGE = grengojbo/pgbouncer

.ONESHELL:
.SHELL := /bin/bas
BOLD=$(shell tput bold)
RED=$(shell tput setaf 1)
GREEN=$(shell tput setaf 2)
YELLOW=$(shell tput setaf 3)
RESET=$(shell tput sgr0)

ifeq ($(TAG),)
TAG := latest
endif

all: help

help:
	@echo "Build Docker image: $(IMAGE):$(TAG)"
	@echo "EXAMPLE:"
	@echo "make release TAG=1.9.1"

release: build push clean
	@echo "$(GREEN)Release completion...$(RESET)"

build:
	@echo "$(YELLOW)Build Docker image: $(IMAGE):$(TAG)$(RESET)"
	@docker build -t $(IMAGE):$(TAG) .

push:
	@echo "$(BOLD)Push Docker image: $(IMAGE):$(TAG)$(RESET)"
	@docker push $(IMAGE):$(TAG)

clean:
	@echo "$(RED)Clean Docker image: $(IMAGE):$(TAG)$(RESET)"
	@docker rmi $(IMAGE):$(TAG)

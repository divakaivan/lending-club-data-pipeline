# Define variables
TERRAFORM_DIR=terraform
DOCKER_COMPOSE_FILE=docker-compose.yml

# Default target when `make` is run without arguments
.DEFAULT_GOAL := help

.PHONY: help
help:  ## Show this help message
	@echo ""
	@echo "If running for the first time, run in order 1~5"
	@echo "Usage: make [option]"
	@echo ""
	@echo "Options:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo ""
	@echo "Make sure to place your kaggle.json and gcp-creds.json files in $(TERRAFORM_DIR)/keys/ so that Terraform and Mage can access them."
	@echo ""

.PHONY: gcp-tf-init
gcp-tf-init:  ## 1. Initialize Terraform
	cd $(TERRAFORM_DIR) && terraform init

.PHONY: gcp-tf-plan
gcp-tf-plan:  ## 2. Plan Terraform changes
	cd $(TERRAFORM_DIR) && terraform plan

.PHONY: gcp-tf-apply
gcp-tf-apply:  ## 3. Apply Terraform changes
	cd $(TERRAFORM_DIR) && terraform apply -auto-approve

.PHONY: docker-build
docker-build:  ## 4. Build Docker Compose
	docker-compose -f $(DOCKER_COMPOSE_FILE) build

.PHONY: docker-up
docker-up:  ## 5. Start Docker Compose
	docker-compose -f $(DOCKER_COMPOSE_FILE) up -d

.PHONY: docker-down
docker-down:  ## 6. Stop Docker Compose
	docker-compose -f $(DOCKER_COMPOSE_FILE) down

# Define variables
TERRAFORM_DIR=terraform
DOCKER_COMPOSE_FILE=docker-compose.yml

# Default target when `make` is run without arguments
.DEFAULT_GOAL := help

.PHONY: help
help:  ## Show this help message
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: terraform-init
terraform-init:  ## Initialize Terraform
	cd $(TERRAFORM_DIR) && terraform init

.PHONY: terraform-plan
terraform-plan:  ## Plan Terraform changes
	cd $(TERRAFORM_DIR) && terraform plan

.PHONY: terraform-apply
terraform-apply:  ## Apply Terraform changes
	cd $(TERRAFORM_DIR) && terraform apply -auto-approve

.PHONY: docker-up
docker-up:  ## Start Docker Compose
	docker-compose -f $(DOCKER_COMPOSE_FILE) up -d

.PHONY: docker-down
docker-down:  ## Stop Docker Compose
	docker-compose -f $(DOCKER_COMPOSE_FILE) down

.PHONY: setup-gcp
setup-gcp: terraform-init terraform-plan terraform-apply  ## Setup GCP with Terraform

.PHONY: run
run: setup-gcp docker-up  ## Setup GCP and run Docker Compose

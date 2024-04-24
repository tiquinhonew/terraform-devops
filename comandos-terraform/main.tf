terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "douglasmoraesterraformstate"
    container_name       = "remote-state"
    key                  = "comandos/terraform.tfstate"
  }
}

provider "aws" {
  region = "eu-central-1"

  default_tags {
    tags = {
      owner      = "douglasmoraes"
      managed-by = "terraform"
    }
  }
}
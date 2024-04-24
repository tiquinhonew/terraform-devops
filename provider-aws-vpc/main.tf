terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }
  }

  backend "s3" {
    bucket = "douglasmoraes-remote-state"
    key    = "provider/terraform.tfstate"
    region = "eu-central-1"
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

provider "aws" {
  alias = "eua"

  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "douglasmoraes"
      managed-by = "terraform"
    }
  }
}

provider "aws" {
  alias = "australia"

  region = "ap-southeast-2"

  default_tags {
    tags = {
      owner      = "douglasmoraes"
      managed-by = "terraform"
    }
  }
}

module "vpc" {
  providers = {
    aws.provider_1 = aws.eua
    aws.provider_2 = aws.australia
  }

  source = "./vpc"
}
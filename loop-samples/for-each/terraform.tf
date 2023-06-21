terraform {
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/aws/5.4.0
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

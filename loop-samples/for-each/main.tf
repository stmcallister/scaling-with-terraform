terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

locals {
    user_names = ["ned","maud","rod","todd"]
}
resource "aws_iam_user" "flanders" {
  for_each = toset(local.user_names)
  name     = each.value
}
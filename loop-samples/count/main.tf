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
  user_name_prefix = "kcdc"
  user_names       = ["marge", "homer", "bart", "lisa", "maggie"]

}

resource "aws_iam_user" "increment" {
  count = 3
  name = "${local.user_name_prefix}.${count.index}"
}


resource "aws_iam_user" "names" {
  count = length(local.user_names)
  name = local.user_names[count.index]
}

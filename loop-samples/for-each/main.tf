## see https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {
  region = "us-east-2"
}

locals {
    user_names = ["ned","maud","rod","todd"]
}

## https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user
resource "aws_iam_user" "flanders" {
  for_each = toset(local.user_names)
  name     = each.value
}
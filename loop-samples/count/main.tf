## see https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {
  region = "us-east-2"
}

locals {
  user_name_prefix = "kcdc"
  user_names       = ["marge", "homer", "bart", "maggie"]

}

## https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user
resource "aws_iam_user" "increment" {
  count = 3
  name = "${local.user_name_prefix}.${count.index}"
}

## https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user
resource "aws_iam_user" "names" {
  count = length(local.user_names)
  name = local.user_names[count.index]
}

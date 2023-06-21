## see https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {
  region = "us-east-2"
}

module "staging_server" {
  source = "./modules/webserver"

  name_level          = "stage"
  s3_bucket_tag_name  = "KCDC TF Demo"
  s3_bucket_tag_level = "Stage"
  db_name             = "kcdcstage"
  db_username         = "preki"
  db_password         = "k1ll3Rcutb4cK"
}

output "staging_info" {
  value = module.staging_server.webserver
}

module "test_server" {
  source = "./modules/webserver"

  name_level          = "test"
  s3_bucket_tag_name  = "KCDC TF Demo"
  s3_bucket_tag_level = "Test"
  db_name             = "kcdctest"
  db_username         = "mojohnston"
  db_password         = "b1Cycl3K1ck"
}

output "test_info" {
  value = module.test_server.webserver
}

module "prod_server" {
  source = "./modules/webserver"

  name_level          = "prod"
  s3_bucket_tag_name  = "KCDC TF Demo"
  s3_bucket_tag_level = "Prod"
  db_name             = "kcdcprod"
  db_username         = "digital"
  db_password         = "t4Kaw1rA"
}

output "prod_info" {
  value = module.prod_server.webserver
}
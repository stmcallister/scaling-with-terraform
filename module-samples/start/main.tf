## see https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {
  region = "us-east-2"
}

## see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "production" {
  ami                    = "ami-0fb653ca2d3203ac1"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.production.id]

  tags = {
    Name = "scott-tf-demo-prod"
  }
}

## see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "production" {
  name = "scott-tf-demo-prod"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

## see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "production" {
  bucket = "scott-tf-kcdc-demo-proood"

  tags = {
    Name        = "Scott TF Demo"
    Environment = "Prod"
  }
}

## see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance
resource "aws_db_instance" "production" {
  identifier_prefix   = "scott-tf-demo-prod"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  db_name             = "kcdc"
  username            = "george_brett"
  password            = "p1n3t4r83"
  skip_final_snapshot = true
}

## see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "staging" {
  ami                    = "ami-0fb653ca2d3203ac1"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.staging.id]

  tags = {
    Name = "scott-tf-demo-staging"
  }
}

## see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "staging" {
  name = "scott-tf-demo-staging"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

## see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "staging" {
  bucket = "scott-tf-kcdc-demo-staging"

  tags = {
    Name        = "KCDC TF Demo"
    Environment = "Stage"
  }
}
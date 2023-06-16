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

resource "aws_instance" "production" {
  ami                    = "ami-0fb653ca2d3203ac1"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.production.id]

  tags = {
    Name = "scott-tf-demo-prod"
  }
}

resource "aws_security_group" "production" {
  name = "scott-tf-demo-prod"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_s3_bucket" "production" {
  bucket = "scott-tf-kcdc-demo-proood"

  tags = {
    Name        = "Scott TF Demo"
    Environment = "Prod"
  }
}

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

resource "aws_instance" "staging" {
  ami                    = "ami-0fb653ca2d3203ac1"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.staging.id]

  tags = {
    Name = "scott-tf-demo-staging"
  }
}

resource "aws_security_group" "staging" {
  name = "scott-tf-demo-staging"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_s3_bucket" "staging" {
  bucket = "scott-tf-kcdc-demo-staging"

  tags = {
    Name        = "KCDC TF Demo"
    Environment = "Stage"
  }
}
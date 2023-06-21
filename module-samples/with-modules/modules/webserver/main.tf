## see https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {
  region = "us-east-2"
}

## see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "webserver" {
  ami                    = "ami-0fb653ca2d3203ac1"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.webserver.id]

  tags = {
    Name = "${var.name_prefix}-${var.name_level}"
  }
}

## see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "webserver" {
  name =  "${var.name_prefix}-${var.name_level}"

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = local.tcp_protocol
    cidr_blocks = local.all_ips
  }
}

## see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "webserver" {
  bucket =  "${var.name_prefix}-${var.name_level}"
  tags = {
    Name        = var.s3_bucket_tag_name
    Environment = var.s3_bucket_tag_level
  }
}

## see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance
resource "aws_db_instance" "webserver" {
  identifier_prefix   =  "${var.name_prefix}-${var.name_level}"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  db_name             = var.db_name
  username            = var.db_username
  password            = var.db_password
  skip_final_snapshot = true
}

locals {
  tcp_protocol = "tcp"
  all_ips      = ["0.0.0.0/0"]
}

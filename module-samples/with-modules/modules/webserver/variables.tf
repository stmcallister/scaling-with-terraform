# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

variable "name_level" {
    description = "Level of server resource is with. ie, prod, dev, stage, etc"
    type = string
}

variable "s3_bucket_tag_name" {
    description = "Name of S3 bucket tag. ie, Scott TF Demo"
    type = string
}

variable "s3_bucket_tag_level" {
    description = "Level of S3 bucket tag"
    type = string
}

variable "db_username" {
    description = "Username for DB user"
    type = string
}

variable "db_password" {
    description = "Password for DB user"
    type = string
}

variable "db_name" {
    description = "Name of database" 
    type = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------
variable "name_prefix" {
    description = "Prefix to identify resources in AWS"
    type = string
    default = "scott-tf-kcdc"
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}
    
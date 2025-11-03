variable "vpc_tags" {
  type = map(string)

}
# AZs you are using
variable "availability_zones" {
  default = ["us-east-1a", "us-east-1b"]
}
# Tags your subnets are tagged with
variable "subnet_tags_aza" {
  default = {
    Role   = "Application" # or "data"
    Access = "Private"     # or "public
  }
}
variable "subnet_tags_azb" {
  default = {
    Role   = "Application" # or "data"
    Access = "Private"     # or "public
  }
}

variable "security_group_tags" {
  description = "Tags used to identify your security groups."
  type        = map(string)
}
################################################################## ECS VARIABLES #######################################################################
# variable "container_image" {
# type        = string
# description = "Container image for the task"
# }
variable "cluster_name" {
  type        = string
  description = "CatApp-cluster"
}
variable "service_name" {
  type        = string
  description = "ECS service name"
}

variable "cluster_arn" {
  type        = string
  description = "Cluster-ARN"
}
variable "desired_count" {
  type        = number
  default     = 1
  description = "Number of ECS tasks to run"
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "albname" {
  type        = string
  description = "alb-Name"
}

variable "bucket_name" {
  description = "Name of the S3 bucket for Terraform state"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the bucket"
  type        = map(string)
  default     = {}
}

variable "ecr_repo" {
  type = string
}

variable "expected_image_tag" {
  type = string
}

variable "actual_image_tag" {
  type = string
}

variable "image_tag" {
  type = string
}


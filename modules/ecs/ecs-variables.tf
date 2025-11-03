variable "cluster_name" {
  type        = string
  description = "CatApp-cluster"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for networking"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs"
}

variable "container_image" {
  type        = string
  description = "Container image for the task"
}

variable "desired_count" {
  type        = number
  default     = 1
  description = "Number of ECS tasks to run"
}
variable "ecs_service-tags" {
  type        = map(string)
  description = "Tags for ecs-service"
}
variable "ecs_tags" {
  type        = map(string)
  description = "Tags for ecs-cluster"
}
variable "target_group_arn" {
  type = string
}
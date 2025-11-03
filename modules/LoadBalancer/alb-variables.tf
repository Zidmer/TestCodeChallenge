variable "albname" {}
variable "vpc_id" {}
variable "public_subnet_ids" {
  type = list(string)
}
variable "tags" {
  type    = map(string)
  default = {}
}
# variable "subnet_ids" {
#   type        = list(string)
#   description = "List of subnet IDs for networking"
# }
# 
# variable "security_group_ids" {
#   type        = list(string)
#   description = "List of security group IDs"
# }

# Fetch the existing VPC by tags
data "aws_vpc" "existingvpc" {
  filter {
    name   = "tag:Name"
    values = [lookup(var.vpc_tags, "Name")]
  }
}

# Fetch subnets tagged with your specific tags AND in a specific AZ
data "aws_subnets" "existingsuba" {
  filter {
    name   = "tag:Role"
    values = [lookup(var.subnet_tags_aza, "Role", "")]
    # values = ["Application"]


  }
  filter {
    name   = "tag:Access"
    values = [lookup(var.subnet_tags_aza, "Access", "")]
    # values = ["Private"]


  }
  filter {
    name   = "availability-zone"
    values = ["us-east-1a"]
  }
}

# Similarly for AZ2
data "aws_subnets" "existingsubb" {
  filter {
    name   = "tag:Role"
    values = [lookup(var.subnet_tags_azb, "Role", "")]
  }
  filter {
    name   = "tag:Access"
    values = [lookup(var.subnet_tags_azb, "Access", "")]
  }
  filter {
    name   = "availability-zone"
    values = ["us-east-1b"]
  }
}
# Fetch security group by tags
data "aws_security_group" "existing" {
  filter {
    name   = "tag:Name"
    values = [lookup(var.security_group_tags, "Name")]
  }
  vpc_id = data.aws_vpc.existingvpc.id
}
data "aws_ecs_service" "expected_ecs_service" {
  cluster_arn  = var.cluster_arn
  service_name = var.service_name
}

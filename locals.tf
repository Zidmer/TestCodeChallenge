locals {
  ecs_tags = {
    Environment  = "Dev"
    Project      = "Codechalllenge"
    ResourceType = "ecs"
  }

  alb_tags = {
    Environment  = "Dev"
    Project      = "Codechallenge"
    ResourceType = "elb"
  }

  S3_tags = {
    Environment  = "Dev"
    Project      = "Codechallenge"
    ResourceType = "S3"
  }


}


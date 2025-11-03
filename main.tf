module "ecs" {
  source             = "./modules/ecs"
  cluster_name       = var.cluster_name
  subnet_ids         = data.aws_subnets.existingsuba.ids # passing the list
  security_group_ids = [data.aws_security_group.existing.id]
  container_image    = "${var.ecr_repo}:${var.image_tag}"
  desired_count      = var.desired_count
  target_group_arn   = module.LoadBalancer.target_group_arn
  ecs_tags           = local.ecs_tags
  ecs_service-tags   = merge(local.ecs_tags, { Name = "${var.cluster_name}-service" })

}

module "LoadBalancer" {
  source  = "./modules/LoadBalancer"
  albname = var.albname
  vpc_id  = data.aws_vpc.existingvpc.id
  # subnet_ids   = var.public_subnet_ids
  public_subnet_ids = var.public_subnet_ids
  # security_group_ids  = [aws_security_group.alb.id] 
  tags = local.alb_tags
}
module "S3" {
  source      = "./modules/S3"
  bucket_name = var.bucket_name
  tags        = local.S3_tags
}
module "testverif" {
  source             = "./modules/testverif"
  expected_image_tag = var.expected_image_tag
  actual_image_tag   = var.actual_image_tag

}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
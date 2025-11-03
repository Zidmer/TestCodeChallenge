output "tf_state_bucket_name" {
  value = module.S3.bucket_name
}
output "debug_existingsuba_ids" {
  value = data.aws_subnets.existingsuba.ids
}
output "public_subnet_ids" {
  value = var.public_subnet_ids
}

output "alb_dns_name" {
  value = module.LoadBalancer.alb_dns_name
}

output "target_group_arn" {
  value = module.LoadBalancer.target_group_arn
}
output "image_tag_match" {
  value = module.testverif.image_tag_match
}

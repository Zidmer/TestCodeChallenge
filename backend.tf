# terraform {
# backend "s3" {
# bucket         = "codechalllengetfstate"  # Replace with your actual S3 bucket name
# key            = "codechallenge/terraform.tfstate"          # Path inside your bucket
# region         = "us-east-1"
# use_lockfile = true             # Name of your lock table
# dynamodb_table = "terraform-locks"
# encrypt        = true
# }
# }
terraform {
  backend "s3" {
    bucket = "codechallengestatebucket" # Replace with your actual S3 bucket name
    key    = "terraform/state.tfstate"  # Path inside your bucket
    region = "us-east-1"
    # use_lockfile = true                     # Name of your lock table
    encrypt = true
  }
}

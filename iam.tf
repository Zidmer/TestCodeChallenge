# Create IAM Role for Terraform assuming
resource "aws_iam_role" "terraform_role" {
  name = "TerraformAssumeRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::531277274015:root" # or your user arn / entity
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach policies for S3 (for state storage)
resource "aws_iam_role_policy_attachment" "s3_access" {
  role       = aws_iam_role.terraform_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

# Attach policies for DynamoDB (for state locking)
resource "aws_iam_role_policy_attachment" "dynamodb_access" {
  role       = aws_iam_role.terraform_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}

# Attach policies for CloudWatch logs (if your infra creates logs)
resource "aws_iam_role_policy_attachment" "cloudwatch_logs" {
  role       = aws_iam_role.terraform_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}

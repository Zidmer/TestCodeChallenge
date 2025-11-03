# Role for ECS Task Execution (for pulling images, logs, etc.)
resource "aws_iam_role" "ecs_task_execution" {
  name = "${var.cluster_name}-task-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })

  tags = var.ecs_tags
}

# Attach the AWS managed policy for ECS task execution
resource "aws_iam_role_policy_attachment" "ecs_task_execution_policy" {
  role       = aws_iam_role.ecs_task_execution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# Role for your application inside the task (can be customized)
resource "aws_iam_role" "ecs_task" {
  name = "${var.cluster_name}-task-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })

  tags = var.ecs_tags
}
resource "aws_iam_role_policy" "ecs_exec_ssm" {
  name = "ecs-exec-ssm"
  role = aws_iam_role.ecs_task.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ssmmessages:CreateControlChannel",
          "ssmmessages:CreateDataChannel",
          "ssmmessages:OpenControlChannel",
          "ssmmessages:OpenDataChannel",
          "ecs:ExecuteCommand",
          "ssm:*"
        ],
        Resource = "*"
      }
    ]
  })
}


# Attach any custom policies needed for your application here
# (for example, allowing access to S3, DynamoDB, etc.)
# Example:
# resource "aws_iam_role_policy" "app_policy" {
#   name = "app-policy"
#   role = aws_iam_role.ecs_task.id
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [...]
#   })
# }
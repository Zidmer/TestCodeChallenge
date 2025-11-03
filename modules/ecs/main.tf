# Create ECS Cluster
resource "aws_ecs_cluster" "main" {
  name = var.cluster_name
  tags = var.ecs_tags
}

# IAM Role for ECS Task Execution (defined in iam.tf, output will be used here)
# Use the output in your task definition
# (Assuming the IAM role arn is necessary in task definition, see below)

# ECS Task Definition
resource "aws_ecs_task_definition" "app" {
  family                   = "${var.cluster_name}-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "1024"
  memory                   = "2048"
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn
  task_role_arn            = aws_iam_role.ecs_task.arn


  container_definitions = jsonencode([{
    name  = "flashweb"
    image = var.container_image
    portMappings = [{
      containerPort = 80
      hostPort      = 80
      protocol      = "tcp"
    }]
    essential = true
  }])
}

# ECS Service
resource "aws_ecs_service" "app" {
  name                   = "${var.cluster_name}-service"
  cluster                = aws_ecs_cluster.main.id
  task_definition        = aws_ecs_task_definition.app.arn
  desired_count          = var.desired_count
  launch_type            = "FARGATE"
  enable_execute_command = true

  network_configuration {
    subnets          = var.subnet_ids
    security_groups  = var.security_group_ids
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "flashweb"
    container_port   = 80

  }
  tags = var.ecs_service-tags
}

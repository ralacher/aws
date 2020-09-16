resource "aws_ecs_cluster" "main" {
  name = "lab"
}

resource "aws_ecs_task_definition" "app" {
  family                   = "todo-app"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  container_definitions    = file("ecs.json")
}

resource "aws_ecs_service" "main" {
  name            = "cb-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [aws_security_group.sg.id]
    subnets          = [aws_subnet.public.id]
    assign_public_ip = true
  }
}
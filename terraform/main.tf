module "stackgen_08570eba-b7ab-4cf6-93fc-bb207bbe05a6" {
  source                               = "./modules/aws_vpc"
  cidr_block                           = "10.0.0.0/16"
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  tags = {
    Environment = "production"
    ManagedBy   = "StackGen"
    Name        = "web-app-vpc"
  }
}

module "stackgen_13d8cf3f-4fe4-41b6-aceb-29aa07f430df" {
  source      = "./modules/aws_security_group"
  description = "Security group for RDS database"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow all outbound"
    from_port        = 0
    ipv6_cidr_blocks = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress                = []
  name                   = "web-app-rds-sg"
  revoke_rules_on_delete = false
  tags = {
    ManagedBy = "StackGen"
    Name      = "web-app-rds-sg"
  }
  timeouts = null
  vpc_id   = module.stackgen_08570eba-b7ab-4cf6-93fc-bb207bbe05a6.id
}

module "stackgen_147f5c9d-4292-4d63-9e49-bab85cf2ee16" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-east-1a"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    ManagedBy = "StackGen"
    Name      = "web-app-public-subnet-1a"
    Type      = "public"
  }
  vpc_id = module.stackgen_08570eba-b7ab-4cf6-93fc-bb207bbe05a6.id
}

module "stackgen_3b27f734-598e-42dc-8758-39a7be1fe258" {
  source          = "./modules/aws_lb_listener"
  certificate_arn = null
  default_action = [{
    target_group_arn = "TG_ARN_PLACEHOLDER"
    type             = "forward"
  }]
  load_balancer_arn = module.stackgen_939344ee-1e94-49c0-9920-b891c4def944.arn
  port              = 80
  protocol          = "HTTP"
  tags = {
    ManagedBy = "StackGen"
    Name      = "web-app-listener"
  }
}

module "stackgen_4bbd795b-f1c1-4b81-96dc-9c6e0d6cf358" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-east-1b"
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  tags = {
    ManagedBy = "StackGen"
    Name      = "web-app-public-subnet-1b"
    Type      = "public"
  }
  vpc_id = module.stackgen_08570eba-b7ab-4cf6-93fc-bb207bbe05a6.id
}

module "stackgen_51beb4c3-e41c-42e1-976b-bd79e4e566bb" {
  source      = "./modules/aws_security_group"
  description = "Security group for Application Load Balancer"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow all outbound"
    from_port        = 0
    ipv6_cidr_blocks = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow HTTP from internet"
    from_port        = 80
    ipv6_cidr_blocks = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 80
    }, {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow HTTPS from internet"
    from_port        = 443
    ipv6_cidr_blocks = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 443
  }]
  name                   = "web-app-alb-sg"
  revoke_rules_on_delete = false
  tags = {
    ManagedBy = "StackGen"
    Name      = "web-app-alb-sg"
  }
  timeouts = null
  vpc_id   = module.stackgen_08570eba-b7ab-4cf6-93fc-bb207bbe05a6.id
}

module "stackgen_57712287-0679-48d9-b7a3-dd0b83dd1ac0" {
  source                                = "./modules/aws_db_instance"
  allocated_storage                     = 20
  allow_major_version_upgrade           = null
  apply_immediately                     = false
  auto_minor_version_upgrade            = true
  availability_zone                     = null
  backup_retention_period               = 7
  backup_target                         = "region"
  backup_window                         = null
  blue_green_update                     = []
  ca_cert_identifier                    = null
  character_set_name                    = null
  copy_tags_to_snapshot                 = false
  custom_iam_instance_profile           = null
  customer_owned_ip_enabled             = null
  db_name                               = "webappdb"
  db_subnet_group_name                  = module.stackgen_597a1adc-acd0-4992-8692-17b1ca2a9d20.name
  dedicated_log_volume                  = null
  delete_automated_backups              = true
  deletion_protection                   = false
  domain                                = null
  domain_auth_secret_arn                = null
  domain_dns_ips                        = null
  domain_fqdn                           = null
  domain_iam_role_name                  = null
  domain_ou                             = null
  enabled_cloudwatch_logs_exports       = null
  engine                                = "postgres"
  engine_lifecycle_support              = "open-source-rds-extended-support"
  engine_version                        = "15.5"
  final_snapshot_identifier             = null
  iam_database_authentication_enabled   = null
  identifier                            = "web-app-db"
  identifier_prefix                     = null
  instance_class                        = "db.t3.micro"
  iops                                  = null
  kms_key_id                            = null
  license_model                         = null
  maintenance_window                    = null
  manage_master_user_password           = null
  master_user_secret_kms_key_id         = null
  max_allocated_storage                 = null
  monitoring_interval                   = 0
  monitoring_role_arn                   = null
  multi_az                              = true
  nchar_character_set_name              = null
  network_type                          = null
  option_group_name                     = null
  parameter_group_name                  = null
  password                              = "ChangeMe123!"
  performance_insights_enabled          = false
  performance_insights_kms_key_id       = null
  performance_insights_retention_period = null
  port                                  = null
  publicly_accessible                   = false
  replica_mode                          = null
  replicate_source_db                   = null
  restore_to_point_in_time              = []
  s3_import                             = []
  skip_final_snapshot                   = true
  snapshot_identifier                   = null
  storage_encrypted                     = true
  storage_throughput                    = null
  storage_type                          = "gp3"
  tags = {
    Environment = "production"
    ManagedBy   = "StackGen"
    Name        = "web-app-db"
  }
  timeouts               = null
  timezone               = null
  upgrade_storage_config = null
  username               = "dbadmin"
  vpc_security_group_ids = [
    module.stackgen_13d8cf3f-4fe4-41b6-aceb-29aa07f430df.id,
  ]
}

module "stackgen_597a1adc-acd0-4992-8692-17b1ca2a9d20" {
  source      = "./modules/aws_db_subnet_group"
  description = "Subnet group for web application RDS database"
  name        = "web-app-db-subnet-group"
  name_prefix = null
  subnet_ids  = []
  tags = {
    ManagedBy = "StackGen"
    Name      = "web-app-db-subnet-group"
  }
}

module "stackgen_64beea23-46c2-41b5-803a-f4cfb9ed88c9" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ecs-tasks.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  description           = "IAM role for ECS task execution"
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "ecs-task-execution-role"
  path                  = null
  permissions_boundary  = null
  tags = {
    ManagedBy = "StackGen"
    Name      = "ecs-task-execution-role"
  }
}

module "stackgen_8ebb4019-bd8c-4ee3-8411-c4c320e545e3" {
  source               = "./modules/aws_lb_target_group"
  deregistration_delay = "300"
  name                 = "web-app-tg"
  port                 = 80
  protocol             = "HTTP"
  tags = {
    ManagedBy = "StackGen"
    Name      = "web-app-tg"
  }
  target_type = "ip"
  vpc_id      = module.stackgen_08570eba-b7ab-4cf6-93fc-bb207bbe05a6.id
}

module "stackgen_939344ee-1e94-49c0-9920-b891c4def944" {
  source                     = "./modules/aws_lb"
  access_logs                = []
  enable_deletion_protection = false
  enable_http2               = true
  internal                   = false
  load_balancer_type         = "application"
  name                       = "web-app-alb"
  security_groups = [
    module.stackgen_51beb4c3-e41c-42e1-976b-bd79e4e566bb.id,
  ]
  subnets = [
    module.stackgen_147f5c9d-4292-4d63-9e49-bab85cf2ee16.id,
    module.stackgen_4bbd795b-f1c1-4b81-96dc-9c6e0d6cf358.id,
  ]
  tags = {
    ManagedBy = "StackGen"
    Name      = "web-app-alb"
  }
}

module "stackgen_a16918db-2297-4808-b7e8-69195c0cee1f" {
  source                   = "./modules/aws_ecs_task_definition"
  container_definitions    = "[{\"name\":\"nginx\",\"image\":\"nginx:latest\",\"essential\":true,\"portMappings\":[{\"containerPort\":80,\"protocol\":\"tcp\"}],\"environment\":[{\"name\":\"DB_NAME\",\"value\":\"webappdb\"},{\"name\":\"DB_USER\",\"value\":\"dbadmin\"}],\"logConfiguration\":{\"logDriver\":\"awslogs\",\"options\":{\"awslogs-group\":\"/ecs/web-app-task\",\"awslogs-region\":\"us-east-1\",\"awslogs-stream-prefix\":\"ecs\"}}}]"
  cpu                      = "256"
  enable_fault_injection   = false
  ephemeral_storage        = []
  execution_role_arn       = module.stackgen_64beea23-46c2-41b5-803a-f4cfb9ed88c9.arn
  family                   = "web-app-task"
  inference_accelerator    = []
  ipc_mode                 = null
  memory                   = "512"
  network_mode             = "awsvpc"
  pid_mode                 = null
  placement_constraints    = []
  proxy_configuration      = []
  requires_compatibilities = ["FARGATE"]
  runtime_platform         = []
  skip_destroy             = false
  tags = {
    ManagedBy = "StackGen"
    Name      = "web-app-task"
  }
  task_role_arn = null
  track_latest  = false
  volume        = []
}

module "stackgen_adf61a17-f184-487b-a569-b540aad0a0ed" {
  source = "./modules/aws_internet_gateway"
  tags = {
    ManagedBy = "StackGen"
    Name      = "web-app-igw"
  }
  vpc_id = module.stackgen_08570eba-b7ab-4cf6-93fc-bb207bbe05a6.id
}

module "stackgen_b31b1cd0-9665-4ad7-94b3-8123697f0246" {
  source                   = "./modules/aws_ecs_cluster"
  configuration            = []
  name                     = "web-app-cluster"
  service_connect_defaults = []
  setting = [{
    name  = "containerInsights"
    value = "enabled"
  }]
  tags = {
    Environment = "production"
    ManagedBy   = "StackGen"
    Name        = "web-app-cluster"
  }
}

module "stackgen_b365af43-cffc-49ec-bb5b-65f33b66c571" {
  source      = "./modules/aws_security_group"
  description = "Security group for ECS tasks"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow all outbound"
    from_port        = 0
    ipv6_cidr_blocks = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress                = []
  name                   = "web-app-ecs-sg"
  revoke_rules_on_delete = false
  tags = {
    ManagedBy = "StackGen"
    Name      = "web-app-ecs-sg"
  }
  timeouts = null
  vpc_id   = module.stackgen_08570eba-b7ab-4cf6-93fc-bb207bbe05a6.id
}

module "stackgen_c1840338-1f4f-4382-a855-529f74d54d94" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/ecs/web-app-task"
  retention_in_days = 7
  tags = {
    ManagedBy = "StackGen"
    Name      = "web-app-logs"
  }
}

module "stackgen_c5b63ee9-cdaa-4118-a0a9-538ded500d26" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  role       = module.stackgen_64beea23-46c2-41b5-803a-f4cfb9ed88c9.name
}

module "stackgen_d43f202c-dd42-4697-9909-77ad9481cf8d" {
  source                             = "./modules/aws_ecs_service"
  availability_zone_rebalancing      = "DISABLED"
  capacity_provider_strategy         = []
  cluster                            = module.stackgen_b31b1cd0-9665-4ad7-94b3-8123697f0246.arn
  deployment_circuit_breaker         = []
  deployment_controller              = []
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  desired_count                      = 2
  enable_ecs_managed_tags            = null
  enable_execute_command             = null
  force_delete                       = null
  force_new_deployment               = null
  health_check_grace_period_seconds  = 60
  iam_role                           = null
  launch_type                        = "FARGATE"
  load_balancer = [{
    container_name   = "nginx"
    container_port   = 80
    target_group_arn = "TG_ARN_PLACEHOLDER"
  }]
  name = "web-app-service"
  network_configuration = [{
    assign_public_ip = false
    security_groups  = ["SG_PLACEHOLDER"]
    subnets          = ["SUBNET_1A_PLACEHOLDER", "SUBNET_1B_PLACEHOLDER"]
  }]
  ordered_placement_strategy = []
  placement_constraints      = []
  platform_version           = "LATEST"
  propagate_tags             = null
  scheduling_strategy        = "REPLICA"
  service_registries         = []
  tags = {
    ManagedBy = "StackGen"
    Name      = "web-app-service"
  }
  task_definition       = module.stackgen_a16918db-2297-4808-b7e8-69195c0cee1f.arn
  timeouts              = null
  wait_for_steady_state = null
}


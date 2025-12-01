module "stackgen_2cc58ff0-c923-444d-8ef0-2573fce00ef8" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"ecs-tasks.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_7ba275-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

module "stackgen_5d08148a-16bb-48c6-9f04-733ef179a52a" {
  source = "./modules/aws_dynamodb"
  attribute = [{
    name = "id"
    type = "S"
  }]
  billing_mode                   = "PROVISIONED"
  global_secondary_indexes       = []
  hash_key                       = "id"
  local_secondary_indexes        = []
  point_in_time_recovery_enabled = true
  range_key                      = ""
  read_capacity                  = 1
  server_side_encryption_enabled = true
  stream_view_type               = "NEW_IMAGE"
  table_name                     = "my-table"
  tags                           = {}
  ttl                            = []
  write_capacity                 = 1
}

module "stackgen_889ad8bf-252f-4c50-a651-2f8a97e1dd1c" {
  source                       = "./modules/aws_s3"
  block_public_access          = true
  bucket_name                  = var.bucket_name
  bucket_policy                = ""
  enable_versioning            = true
  enable_website_configuration = false
  sse_algorithm                = "aws:kms"
  tags                         = {}
  website_error_document       = "404.html"
  website_index_document       = "index.html"
}

module "stackgen_9311c5bb-f2ed-42cc-af88-0c378956e2a8" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Reader-stackgen_7a658d"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"ead29c1c4d2746c0bdfa33dbb5b45b700\",\n      \"Action\": [\n        \"s3:Get*\",\n        \"s3:List*\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_$${module.stackgen_889ad8bf-252f-4c50-a651-2f8a97e1dd1c.arn}.arn}\",\n        \"${module.stackgen_ead29c1c-4d27-46c0-bdfa-33dbb5b45b70.arn}/*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_2cc58ff0-c923-444d-8ef0-2573fce00ef8.name
  role_type = "Reader"
}

module "stackgen_b4977c40-5301-4769-a106-8c0af35a525a" {
  source                    = "./modules/aws_ecs"
  cpu_architecture          = "X86_64"
  create_ingress_alb        = true
  ecs_cluster_name          = var.ecs_cluster_name
  ecs_service_desired_count = 1
  ecs_service_name          = "my-ecs-service"
  ecs_task_container_cpu    = 256
  ecs_task_container_memory = 512
  ecs_task_container_name   = "my-ecs-container"
  ecs_task_container_port   = 80
  ecs_task_image_url        = var.ecs_task_image_url
  environment_variables     = {}
  health_check_path         = "/"
  internal_alb              = true
  network_mode              = "awsvpc"
  operating_system          = "LINUX"
  private_subnet_ids        = []
  protocol                  = "HTTP"
  public_subnet_ids         = []
  region                    = var.region
  tags                      = {}
  task_role_arn             = module.stackgen_2cc58ff0-c923-444d-8ef0-2573fce00ef8.arn
}

module "stackgen_c6ff3a49-a605-418a-a3d5-73991c10a2d4" {
  source                       = "./modules/aws_elasticache"
  access_string                = "asdf"
  az_mode                      = "single-az"
  cloudwatch_retention_in_days = 30
  cluster_id                   = "asdf"
  enable_redis_log_delivery    = false
  engine                       = "redis"
  family                       = "asdf"
  log_format                   = "json"
  log_type                     = "engine-log"
  node_type                    = "cache.m5.large"
  num_cache_nodes              = 1
  password                     = null
  port                         = null
  security_group_ids           = []
  subnet_ids                   = []
  tags                         = {}
  use_vpc                      = false
  user_id                      = "asdf"
  user_name                    = "asdf"
}

module "stackgen_d0f35d3d-5d83-4770-a673-6db048ee79bc" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Reader-stackgen_97e4fc"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"9658830efd854aa4a70c3022249286c90\",\n      \"Action\": [\n        \"elasticache:Describe*\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_$${module.stackgen_c6ff3a49-a605-418a-a3d5-73991c10a2d4.arn}.arn}\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_2cc58ff0-c923-444d-8ef0-2573fce00ef8.name
  role_type = "Reader"
}

module "stackgen_dce73538-12a0-4957-a5a5-672eafa90ece" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Reader-stackgen_fafe74"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"1b25429d3dfb408d80412c1a284a1a480\",\n      \"Action\": [\n        \"dynamodb:DescribeTable\",\n        \"dynamodb:ListTables\",\n        \"dynamodb:GetItem\",\n        \"dynamodb:BatchGetItem\",\n        \"dynamodb:Query\",\n        \"dynamodb:Scan\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_$${module.stackgen_5d08148a-16bb-48c6-9f04-733ef179a52a.arn}.arn}\",\n        \"${module.stackgen_1b25429d-3dfb-408d-8041-2c1a284a1a48.arn}/*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_2cc58ff0-c923-444d-8ef0-2573fce00ef8.name
  role_type = "Reader"
}


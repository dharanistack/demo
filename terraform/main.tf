module "stackgen_0f125e1b-4b47-446e-934f-091eaf73e7cb" {
  source = "./modules/custom_custom-s3-bucket-modules22245_1.0.0_1"
}

module "stackgen_35ccd003-b5b4-4d62-8b1f-b05479413ae0" {
  source = "./modules/custom_custom-s3-bucket-modules22245_1.0.0_1"
}

module "stackgen_403434cf-b423-42a8-88e3-5482f8525eb2" {
  source = "./modules/custom_custom-s3-bucket-modules22245_1.0.0_1"
}

module "stackgen_5400f01c-df62-465f-9567-99b29d0ecef4" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Reader-stackgen_fafe74"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"1b25429d3dfb408d80412c1a284a1a480\",\n      \"Action\": [\n        \"dynamodb:DescribeTable\",\n        \"dynamodb:ListTables\",\n        \"dynamodb:GetItem\",\n        \"dynamodb:BatchGetItem\",\n        \"dynamodb:Query\",\n        \"dynamodb:Scan\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_$${module.stackgen_c9ac5fd0-ba2e-4a39-af6f-9e15cb98aa90.arn}.arn}\",\n        \"${module.stackgen_1b25429d-3dfb-408d-8041-2c1a284a1a48.arn}/*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_e51b01bc-b127-4b92-aa08-14dea2970d68.name
  role_type = "Reader"
}

module "stackgen_971cc821-29ad-4713-b9f8-6cd12180497f" {
  source = "./modules/custom_custom-s3-bucket-modules22245_1.0.0_1"
}

module "stackgen_a40bbe38-b518-4db0-8d45-a0962f2111a0" {
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

module "stackgen_b3448dfd-ff43-4c8e-b1c1-7d83665a855f" {
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

module "stackgen_c9ac5fd0-ba2e-4a39-af6f-9e15cb98aa90" {
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

module "stackgen_cba75702-5606-4542-805f-b54c8e44d5c3" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Reader-stackgen_97e4fc"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"9658830efd854aa4a70c3022249286c90\",\n      \"Action\": [\n        \"elasticache:Describe*\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_$${module.stackgen_b3448dfd-ff43-4c8e-b1c1-7d83665a855f.arn}.arn}\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_e51b01bc-b127-4b92-aa08-14dea2970d68.name
  role_type = "Reader"
}

module "stackgen_e51b01bc-b127-4b92-aa08-14dea2970d68" {
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

module "stackgen_eabbb5a9-f93c-4a3d-ae7b-00956fd62bda" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Reader-stackgen_7a658d"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"ead29c1c4d2746c0bdfa33dbb5b45b700\",\n      \"Action\": [\n        \"s3:Get*\",\n        \"s3:List*\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_$${module.stackgen_a40bbe38-b518-4db0-8d45-a0962f2111a0.arn}.arn}\",\n        \"${module.stackgen_ead29c1c-4d27-46c0-bdfa-33dbb5b45b70.arn}/*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_e51b01bc-b127-4b92-aa08-14dea2970d68.name
  role_type = "Reader"
}

module "stackgen_ee28161b-95dc-4275-b489-75f302e1e41e" {
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
  task_role_arn             = module.stackgen_e51b01bc-b127-4b92-aa08-14dea2970d68.arn
}


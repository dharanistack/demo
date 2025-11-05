module "stackgen_17d06135-be6a-5962-a85d-ac5314e88b76" {
  source                               = "./modules/aws_vpc"
  cidr_block                           = "10.0.0.0/12"
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  tags = {
    Name = "MainVPC"
  }
}

module "stackgen_39584f24-c1f5-57bf-b2f8-6eb862a67d39" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"lambda.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "lambda-execution-role"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_49a7552b-72d3-594a-85d0-93e0641001f3" {
  source = "./modules/aws_internet_gateway"
  tags = {
    Name = "InternetGateway"
  }
  vpc_id = module.stackgen_17d06135-be6a-5962-a85d-ac5314e88b76.id
}

module "stackgen_750c9fd0-8971-5c2b-9108-acca15204a66" {
  source = "./modules/aws_route_table"
  route = [{
    carrier_gateway_id         = ""
    cidr_block                 = "0.0.0.0/0"
    core_network_arn           = ""
    destination_prefix_list_id = ""
    egress_only_gateway_id     = ""
    gateway_id                 = "igw-0530ba13a36889792"
    ipv6_cidr_block            = ""
    local_gateway_id           = ""
    nat_gateway_id             = ""
    network_interface_id       = ""
    transit_gateway_id         = ""
    vpc_endpoint_id            = ""
    vpc_peering_connection_id  = ""
  }]
  tags = {
    Name = "PublicRouteTable"
  }
  vpc_id = module.stackgen_17d06135-be6a-5962-a85d-ac5314e88b76.id
}

module "stackgen_76fd892b-f4cc-5202-8495-a5406b0729d9" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "eu-north-1b"
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = false
  tags = {
    Name = "PrivateSubnet-2"
  }
  vpc_id = module.stackgen_17d06135-be6a-5962-a85d-ac5314e88b76.id
}

module "stackgen_7fde6093-ec66-5bb9-9f82-133dfe6f8dae" {
  source                      = "./modules/aws_instance"
  ami                         = "ami-00f34bf9aeacdf007"
  associate_public_ip_address = false
  availability_zone           = "eu-north-1b"
  capacity_reservation_specification = [{
    capacity_reservation_preference = "open"
    capacity_reservation_target     = []
  }]
  cpu_options = [{
    amd_sev_snp      = ""
    core_count       = 1
    threads_per_core = 2
  }]
  credit_specification = [{
    cpu_credits = "unlimited"
  }]
  disable_api_stop        = false
  disable_api_termination = false
  ebs_block_device        = []
  ebs_optimized           = false
  enable_primary_ipv6     = null
  enclave_options = [{
    enabled = false
  }]
  ephemeral_block_device               = []
  get_password_data                    = false
  hibernation                          = false
  host_id                              = ""
  host_resource_group_arn              = null
  iam_instance_profile                 = ""
  instance_initiated_shutdown_behavior = "stop"
  instance_market_options              = []
  instance_type                        = "t3.micro"
  ipv6_address_count                   = 0
  ipv6_addresses                       = []
  key_name                             = "example-key-pair"
  launch_template                      = []
  maintenance_options = [{
    auto_recovery = "default"
  }]
  metadata_options           = []
  monitoring                 = true
  network_interface          = []
  placement_group            = ""
  placement_partition_number = 0
  private_dns_name_options = [{
    enable_resource_name_dns_a_record    = false
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }]
  private_ip = "10.0.1.94"
  root_block_device = [{
    delete_on_termination = true
    device_name           = "/dev/xvda"
    encrypted             = false
    iops                  = 3000
    kms_key_id            = ""
    tags                  = {}
    tags_all              = {}
    throughput            = 125
    volume_id             = "vol-09440863e93213217"
    volume_size           = 8
    volume_type           = "gp3"
  }]
  secondary_private_ips = []
  security_groups       = []
  source_dest_check     = true
  subnet_id             = module.stackgen_f16efc42-7c9a-5789-88af-16fdf8fe4ad7.id
  tags = {
    Name = "MyEC2Instance"
  }
  tenancy                     = "default"
  timeouts                    = null
  user_data                   = null
  user_data_base64            = null
  user_data_replace_on_change = false
  volume_tags                 = null
  vpc_security_group_ids      = ["sg-0ecc688a5795d05b8"]
}

module "stackgen_9069a3e8-730a-5152-afcd-2902d6871429" {
  source              = "./modules/aws_s3_bucket"
  bucket              = "example-bucket-name-793842"
  force_destroy       = false
  object_lock_enabled = false
  tags = {
    Name = "DataBucket"
  }
}

module "stackgen_949890a2-e3ef-5c60-8e43-34d47d31b3f5" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/ExampleLambdaFunction9283"
  retention_in_days = 7
  tags = {
    Name = "LambdaLogGroup"
  }
}

module "stackgen_9c1d6ee8-c47a-56bd-95b8-6d93150a5b3d" {
  source = "./modules/aws_dynamodb_table"
  attribute = [{
    name = "id"
    type = "S"
  }]
  billing_mode           = "PROVISIONED"
  global_secondary_index = []
  hash_key               = "id"
  local_secondary_index  = []
  name                   = "ExampleDynamoDBTable8475"
  point_in_time_recovery = [{
    enabled                 = false
    recovery_period_in_days = 0
    }, {
    enabled = true
  }]
  range_key     = null
  read_capacity = 0
  server_side_encryption = [{
    enabled = true
  }]
  stream_enabled   = false
  stream_view_type = ""
  tags = {
    Name = "MainDynamoDBTable"
  }
  timeouts = null
  ttl = [{
    attribute_name = ""
    enabled        = false
  }]
  write_capacity = 0
}

module "stackgen_a8b5f2d5-a0be-5d27-8c8e-cc9ed737740e" {
  source                  = "./modules/aws_lambda_function"
  architectures           = ["x86_64"]
  code_signing_config_arn = "arnval"
  dead_letter_config      = []
  description             = ""
  environment             = []
  ephemeral_storage = [{
    size = 512
  }]
  file_system_config = []
  filename           = "./lambda_function.zip"
  function_name      = "ExampleLambdaFunction9283"
  handler            = "lambda_function.lambda_handler"
  image_config       = []
  image_uri          = ""
  kms_key_arn        = ""
  layers             = []
  logging_config = [{
    application_log_level = ""
    log_format            = "Text"
    log_group             = "/aws/lambda/ExampleLambdaFunction9283"
    system_log_level      = ""
  }]
  memory_size                        = 128
  package_type                       = "Zip"
  publish                            = false
  replace_security_groups_on_destroy = null
  replacement_security_group_ids     = []
  reserved_concurrent_executions     = -1
  role                               = module.stackgen_39584f24-c1f5-57bf-b2f8-6eb862a67d39.arn
  runtime                            = "python3.9"
  s3_bucket                          = null
  s3_key                             = null
  skip_destroy                       = false
  snap_start                         = []
  source_code_hash                   = "OgyMpnTtoIHFn2ICvdzSZ9ubt76QYikymJaqZBA3WqA="
  tags = {
    pm = "dharani"
  }
  timeout  = 3
  timeouts = null
  tracing_config = [{
    mode = "PassThrough"
    }, {
    mode = "Active"
  }]
  vpc_config = []
}

module "stackgen_b07c89d2-eb19-51c5-ad4d-c47709e14e4d" {
  source         = "./modules/aws_route_table_association"
  gateway_id     = ""
  route_table_id = module.stackgen_750c9fd0-8971-5c2b-9108-acca15204a66.id
  subnet_id      = module.stackgen_f16efc42-7c9a-5789-88af-16fdf8fe4ad7.id
}

module "stackgen_c517590d-0c78-5b9a-936f-2e2c7245028f" {
  source                      = "./modules/aws_route"
  carrier_gateway_id          = ""
  core_network_arn            = ""
  destination_cidr_block      = "0.0.0.0/0"
  destination_ipv6_cidr_block = ""
  destination_prefix_list_id  = ""
  egress_only_gateway_id      = ""
  gateway_id                  = "igw-0530ba13a36889792"
  local_gateway_id            = ""
  nat_gateway_id              = ""
  network_interface_id        = ""
  route_table_id              = "rtb-0faaf77a6ba47dfe6"
  timeouts                    = null
  transit_gateway_id          = ""
  vpc_endpoint_id             = ""
  vpc_peering_connection_id   = ""
}

module "stackgen_c585a9fa-3424-5209-b0d1-711ccf42498d" {
  source         = "./modules/aws_route_table_association"
  gateway_id     = ""
  route_table_id = module.stackgen_750c9fd0-8971-5c2b-9108-acca15204a66.id
  subnet_id      = module.stackgen_76fd892b-f4cc-5202-8495-a5406b0729d9.id
}

module "stackgen_e544d5a2-37bd-5b39-a811-82782ef37689" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = module.stackgen_39584f24-c1f5-57bf-b2f8-6eb862a67d39.name
}

module "stackgen_f16efc42-7c9a-5789-88af-16fdf8fe4ad7" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "eu-north-1b"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = false
  tags = {
    Name = "PrivateSubnet-1"
  }
  vpc_id = module.stackgen_17d06135-be6a-5962-a85d-ac5314e88b76.id
}


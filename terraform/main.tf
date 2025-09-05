module "stackgen_17d06135-be6a-5962-a85d-ac5314e88b76" {
  source                               = "./modules/aws_vpc"
  cidr_block                           = "10.0.0.0/16"
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  tags = {
    Name = "MainVPC"
  }
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
  metadata_options = [{
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }]
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
    encrypted             = false
    iops                  = 3000
    kms_key_id            = ""
    tags                  = {}
    throughput            = 125
    volume_size           = 8
    volume_type           = "gp3"
  }]
  secondary_private_ips = []
  security_groups       = []
  source_dest_check     = true
  subnet_id             = "subnet-089f0a51a31acbd10"
  tags = {
    Name = "MyEC2Instance"
  }
  tenancy                     = "default"
  timeouts                    = null
  user_data                   = null
  user_data_base64            = null
  user_data_replace_on_change = false
  volume_tags                 = {}
  vpc_security_group_ids      = ["sg-0ecc688a5795d05b8"]
}


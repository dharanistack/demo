module "stackgen_134452a9-1bc6-42b4-b1d0-70753f4c4a09" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-east-1a"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Environment = "production"
    ManagedBy   = "StackGen"
    Name        = "network-stack-public-subnet-1a"
    Type        = "public"
  }
  vpc_id = module.stackgen_b61e2aa2-00d1-4a32-beb2-fa35cbec13a2.id
}

module "stackgen_3ac79643-b65b-4ecd-8082-abf5d66f223e" {
  source = "./modules/aws_internet_gateway"
  tags = {
    Environment = "production"
    ManagedBy   = "StackGen"
    Name        = "network-stack-igw"
  }
  vpc_id = module.stackgen_b61e2aa2-00d1-4a32-beb2-fa35cbec13a2.id
}

module "stackgen_92e09b63-c33a-4c20-a838-cf4df09dc851" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-east-1a"
  cidr_block              = "10.0.10.0/24"
  map_public_ip_on_launch = false
  tags = {
    Environment = "production"
    ManagedBy   = "StackGen"
    Name        = "network-stack-private-subnet-1a"
    Type        = "private"
  }
  vpc_id = module.stackgen_b61e2aa2-00d1-4a32-beb2-fa35cbec13a2.id
}

module "stackgen_a9282d55-2ac2-4ada-8107-960b87fa5b53" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-east-1b"
  cidr_block              = "10.0.11.0/22"
  map_public_ip_on_launch = false
  tags = {
    Environment = "production"
    ManagedBy   = "StackGen"
    Name        = "network-stack-private-subnet-1b"
    Type        = "private"
  }
  vpc_id = module.stackgen_b61e2aa2-00d1-4a32-beb2-fa35cbec13a2.id
}

module "stackgen_b61e2aa2-00d1-4a32-beb2-fa35cbec13a2" {
  source                               = "./modules/aws_vpc"
  cidr_block                           = "10.0.0.0/16"
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  tags = {
    Environment = "production"
    ManagedBy   = "StackGen"
    Name        = "network-stack-vpc"
  }
}

module "stackgen_decf33ab-453d-4790-aefb-43674ab9efdd" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-east-1b"
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  tags = {
    Environment = "production"
    ManagedBy   = "StackGen"
    Name        = "network-stack-public-subnet-1b"
    Type        = "public"
  }
  vpc_id = module.stackgen_b61e2aa2-00d1-4a32-beb2-fa35cbec13a2.id
}


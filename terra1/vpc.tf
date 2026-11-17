data "aws_availability_zones" "available" {
  state = "available"
}


locals {
  azs = slice(data.aws_availability_zones.available.names, 0, 3)

  public_subnets = [for k, v in local.azs : cidrsubnet("10.0.0.0/16", 8, k + 4)]
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.0"

  name = "trainee-project-vpc"
  cidr = "10.0.0.0/16"

  azs             = local.azs
  public_subnets  = local.public_subnets


  private_subnets = []

  enable_nat_gateway = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Environment = "dev"
    Project     = "trainee-project"
  }
}
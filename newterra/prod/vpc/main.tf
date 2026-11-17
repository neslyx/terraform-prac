module "vpc" {
  source = "../../modules/vpc"

  name_prefix = "prod-trainee-project"

  azs = [
    "eu-north-1a",
    "eu-north-1b",
    "eu-north-1c"
  ]

  vpc_cidr = "10.1.0.0/16"
}

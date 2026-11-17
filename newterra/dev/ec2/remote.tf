data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "buket_state"
    key    = "dev/vpc.tfstate"
    region = "eu-north-1"

    endpoint = "http://localhost:4566"

    access_key = "test"
    secret_key = "test"

    skip_credentials_validation = true
    skip_region_validation      = true

    use_path_style = true
  }
}

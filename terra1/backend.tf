terraform {
  backend "s3" {
    bucket = "buketik"

    key    = "dev/terraform.tfstate"
    region = "eu-north-1"

    dynamodb_table = "dynamolock"
    encrypt        = true

    endpoints = {
      s3       = "http://localhost:4566"
      dynamodb = "http://localhost:4566"
    }

    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true

    # Использовать path-style URL (требование LocalStack/Floci для S3)
    use_path_style              = true
  }
}
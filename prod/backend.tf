terraform {
  backend "s3" {
    bucket         = "abhi-state-bucket-dev"
    key            = "infra/dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "tf-locks" # Ensure this table exists before applying the configuration
    encrypt        = true
  }
}

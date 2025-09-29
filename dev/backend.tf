terraform {
  backend "s3" {
    bucket         = "tf-state-demo-ap-south-1"
    key            = "infra/dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "tf-locks"
    encrypt        = true
  }
}

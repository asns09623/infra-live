module "kms" {
  source = "git::https://github.com/asns09623/test-modules.git//kms?ref=v1.0.0"
  env    = var.env
}
module "vpc" {
  source = "git::https://github.com/asns09623/test-modules.git//vpc?ref=v1.0.0"
  vpc_cidr   = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones = var.availability_zones
}
module "dns" {
  source = "git::https://github.com/asns09623/test-modules.git//dns?ref=v1.0.0"
  env    = var.env
}

#module "irsa" {
#  source     = "git::https://github.com/asns09623/test-modules.git//irsa?ref=v1.0.0"
#  env        = var.env
#  cluster_id = var.env
#  region     = var.region
#}

module "iam" {
  source = "git::https://github.com/asns09623/test-modules.git//iam?ref=v1.0.0"
  env    = var.env
}
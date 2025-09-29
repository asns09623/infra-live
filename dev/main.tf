module "kms" {
  source = "git::https://github.com/asns09623/test-modules.git//kms?ref=v1.0.3"
  env    = var.env
}
module "vpc" {
  source = "git::https://github.com/asns09623/test-modules.git//vpc?ref=v1.0.3"
  vpc_cidr   = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones = var.availability_zones
}
module "dns" {
  source = "git::https://github.com/asns09623/test-modules.git//dns?ref=v1.0.3"
  env    = var.env
}




output "hosted_zone_id" {
  value = module.dns.hosted_zone_id
}

output "hosted_zone_name" {
  value = module.dns.hosted_zone_name
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "kms_key_arn" {
  value = module.kms.kms_key_arn
}

output "oidc_provider_arn" {
  value = module.irsa.oidc_provider_arn
  description = "AWS IAM OIDC provider ARN"
}

output "issuer_url" {
  description = "The OIDC issuer URL (matches iss claim in tokens)"
  value       = module.irsa.issuer_url
}

output "irsa_role_arns" {
  value = module.iam.irsa_role_arns
}

module "irsa" {
  source     = "git::https://github.com/asns09623/test-modules.git//irsa?ref=v1.0.3"
}

module "iam" {
  source = "git::https://github.com/asns09623/test-modules.git//iam?ref=v1.0.3"
  oidc_provider_arn = module.irsa.oidc_provider_arn
  oidc_issuer_url   = module.irsa.issuer_url
}



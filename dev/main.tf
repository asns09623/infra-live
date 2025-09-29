module "state" {
  source          = "../../infra-modules/modules/s3_backend"
  bucket_name     = var.state_bucket
  lock_table_name = var.lock_table
}
module "kms"   { source = "../../infra-modules/modules/kms" alias = "${var.env}-kops-apps" }
module "vpc"   {
  source = "../../infra-modules/modules/vpc"
  name   = "${var.env}-vpc"
  cidr   = var.vpc_cidr
  azs    = var.azs
}
module "dns"   { source = "../../infra-modules/modules/dns" zone_name = "${var.env}.${var.base_domain}" }
module "kops_state" { source = "../../infra-modules/modules/kops_state_bucket" bucket_name = "kops-state-${var.env}-${var.account_alias}" }

output "vpc_id"             { value = module.vpc.vpc_id }
output "public_subnet_ids"  { value = module.vpc.public_subnet_ids }
output "private_subnet_ids" { value = module.vpc.private_subnet_ids }
output "zone_id"            { value = module.dns.zone_id }
output "zone_name"          { value = module.dns.zone_name }
output "kops_state"         { value = module.kops_state.kops_state }
output "kms_key_arn"        { value = module.kms.key_arn }

variable "env"           { type = string }
variable "account_alias" { type = string }
variable "region"        { type = string  default = "ap-south-1" }
variable "state_bucket"  { type = string }
variable "lock_table"    { type = string }
variable "base_domain"   { type = string }
variable "vpc_cidr"      { type = string  default = "10.30.0.0/16" }
variable "azs"           { type = list(string) default = ["ap-south-1a","ap-south-1b","ap-south-1c"] }

init: ; terraform init
plan: ; terraform plan -var-file=terraform.tfvars
apply: ; terraform apply -auto-approve -var-file=terraform.tfvars | tee apply.log
outputs: ; terraform output -json | tee outputs.json
destroy: ; terraform destroy -auto-approve -var-file=terraform.tfvars

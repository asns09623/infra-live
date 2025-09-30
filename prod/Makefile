SHELL := /bin/bash
TF   ?= terraform

init:
	$(TF) init

plan:
	$(TF) plan -out=plan.out

apply:
	$(TF) apply -auto-approve plan.out

destroy:
	$(TF) destroy -auto-approve

outputs-json:
	$(TF) output -json > tf-outputs.json

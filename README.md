# Build server

- cd server
- docker build -t server:1.0 .

# Build client

- cd client
- docker build -t client:1.0 .

The above steps are now part of the terraform code.

# Deployment

- cd infra
- terraform init

## Plan to view the infra changes
- terraform plan -var-file="env/dev.tfvars"

## Apply infra changes
- terraform apply -var-file="env/dev.tfvars"

## Destroy infra changes
- terraform destroy -var-file="env/dev.tfvars"
# Build server

- cd server
- docker build -t server:1.0 .

# Build client

- cd client
- docker build -t client:1.0 .

The above steps are now part of the terraform code.

# Deploy containers

- cd infra/application
- Run `docker run -d -p 8200:8200 hashicorp/vault` and `export TF_VAR_VAULT_TOKEN=<Value>`
    - The Value is seen in the logs of the container.
    - Create a secret in this vault named `docker-hub` having keys named `username` and `password`.
- terraform init
- terraform apply

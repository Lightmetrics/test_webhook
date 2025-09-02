#!/bin/sh

# Download and install Terraform inside Docker
apk add --no-cache curl unzip

TERRAFORM_VERSION=1.8.5

curl -fsSL https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform.zip
unzip terraform.zip
mv terraform /usr/local/bin/
terraform -version

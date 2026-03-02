provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-flask-app-bucket-unique"
  acl    = "private"
}

provider "aws" {
  access_key = "AKIAUD7KQ6YJZNUBW55I"
  secret_key = "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"
}
terraform {
  backend "s3" {
    bucket         = "terraform.poc.backend  "
    key            = "terraform/terraform.tfstate"
    region         = "us-east-1" 
  }
}

resource "aws_s3_bucket" "backend1" {
  bucket = "terraform-poc-bucket-11"
  tags = {
    Name        = "terraform-state"
    Env        = "Dev"
  }
  versioning {
    enabled = true
  }
}
resource "aws_s3_bucket_object" "FolderForStateFile" {
  bucket = aws_s3_bucket.backend.id
  key    = "terraform/state/"
  content = ""
}

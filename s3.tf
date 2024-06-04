provider "aws" {
  
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

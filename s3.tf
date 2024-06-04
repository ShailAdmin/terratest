resource "aws_s3_bucket" "backend" {
  bucket = "terraform-poc-bucket-1"
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

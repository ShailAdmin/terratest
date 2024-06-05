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

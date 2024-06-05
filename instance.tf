provider "aws" {
    region = "us-east-1"  
}

resource "aws_instance" "foo" {
  ami           = "ami-05fa00d4c63e32376" # us-west-2
  instance_type = "t2.micro"
  tags = {
      Name = "TF-Instance"
  }
}
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

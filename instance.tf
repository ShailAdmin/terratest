provider "aws" {
    region = "ap-south-1"  
}
resource "aws_s3_bucket" "my_bucket" {
  bucket = "jenkinstest1234testjenkins" # Change this to your desired bucket name
  acl    = "private" # Access control list, you can change this as needed
}

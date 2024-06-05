provider "aws" {
    region = "us-east-1"  
}
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name" # Change this to your desired bucket name
  acl    = "private" # Access control list, you can change this as needed
}

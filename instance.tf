provider "aws" {
    region = "ap-south-1"  
}
resource "aws_s3_bucket" "my_bucket" {
  bucket = "jenkinstest1234testjenkins" # Change this to your desired bucket name
  acl    = "private" # Access control list, you can change this as needed
}
resource "aws_instance" "my_instance" {
  ami           = "ami-00beae93a2d981137" # Change this to your desired AMI ID
  instance_type = "t2.micro"      # Change this to your desired instance type
  tags = {
    Name = "MyEC2Instance"        # Change this to your desired name
  }
}

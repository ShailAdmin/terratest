terraform {
  backend "s3" {
    bucket         = "terraform-poc-bucket-1"
    key            = "terraform/terraform.tfstate"
    region         = "us-east-1" 
  }
}
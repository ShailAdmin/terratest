terraform {
  backend "s3" {
    bucket         = "jenkinstest1234testjenkins"
    key            = "terraform.tfstate"
    region         = "ap-south-1" 
  }
}

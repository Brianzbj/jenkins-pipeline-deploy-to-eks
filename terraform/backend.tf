terraform {
  backend "s3" {
    bucket = "brianjenkins"
    region = "us-west-1"
    key = "VPC/terraform.tfstate"
    profile = "ms"
  }
}
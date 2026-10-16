terraform {
  backend "s3" {
    bucket = "terraform-state-file.07"
    key    = "devops-project/terraform.tfstate"
    region = "us-east-1"
  }
}
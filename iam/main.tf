terraform {
  required_version = ">= 0.11, < 0.12"

  backend "s3" {
    bucket = "cloudtitlan-terraform"
    key    = "iam/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "sctp-tfstate-ce13"
    key    = "jaz-31-terraform.tfstate"
    region = "us-east-1"
  }
}
provider "aws" {
  region = "us-east-1"
}


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2"
    }
  }
}

terraform {
  required_version = ">= 1.0" 
}

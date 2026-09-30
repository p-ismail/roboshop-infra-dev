terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.62.0" #terraform aws provided version
    }
  }
  backend "s3" {
    bucket         = "ismail-remote-state-dev" # our s3 storage bucket name
    key            = "roboshop-dev-sg"            
    region         = "us-east-1"                                            
    encrypt        = false
    use_lockfile = false                                  
  }

}

provider "aws" {
    region = "us-east-1"
}
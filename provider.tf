provider "aws" {
  region = var.aws_region

  # Allow any 2.x version of the AWS provider
  version = "~> 3.0"

  access_key = var.access_key
  secret_key = var.secret_key
}

//provider "aws" {
//  region = var.aws_region
//
//  # Allow any 2.x version of the AWS provider
//  version = "~> 2.0"
//
//  shared_credentials_file = "/Users/ryu/.aws/credentials"
//  profile = "default"
//}
//

data "aws_caller_identity" "current" {}

data "aws_iam_account_alias" "current" {}

data "aws_availability_zones" "azs" {
  state = "available"
}

data "http" "myip" {
  url = "https://ipv4.icanhazip.com"
}



data "aws_ssm_parameter" "ubuntu-focal" {
  name = "/aws/service/canonical/ubuntu/server/16.04/stable/current/amd64/hvm/ebs-gp2/ami-id"
}


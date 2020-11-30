data "aws_caller_identity" "current" {}

data "aws_iam_account_alias" "current" {}

data "aws_availability_zones" "azs" {
  state = "available"
}

data "http" "myip" {
  url = "https://ipv4.icanhazip.com"
}


data "aws_ssm_parameter" "LinuxAmi-Master" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

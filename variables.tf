variable "aws_region" {
  type        = string
  description = "AWS Region."
  //  default     = "us-east-2"
}

variable "app_name" {
  type        = string
  description = "Sample configuration and deployment of OpenEDX using Terraform and Ansible"
  default     = "OpenEDX_Deployment_EC2"
}

variable "app_instance" {
  type        = string
  description = "Application instance name (ie. honolulu, customer_name, department, etc.)."
  default     = "edx-instance"
}

variable "app_stage" {
  type        = string
  description = "Application stage (ie. dev, prod, qa, etc)."
  default     = "prod"
}

variable "global_tags" {
  type = map(string)

  default = {
    Provisioner = "Terraform"
    Owner       = "shekarau buba"
  }
}

variable "ami" {
  type        = string
  description = "Default ami used in the tutorial"

}

variable "instance_type" {
  type        = string
  description = "default instance type"
  default     = "t2.large"
}


variable "access_key" {
  type        = string
  description = "Access Key"

}

variable "secret_key" {
  type        = string
  description = "Secret Access Key"


}

variable "profile" {
  default = "prenovate-admin"
}
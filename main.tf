terraform {
  required_version = "~> 0.13"

  backend "remote" {
    organization = "prennovate"

    # Fill Workspace
    workspaces {
      name = "openEDX_DepoymentEC2"
    }
  }

}

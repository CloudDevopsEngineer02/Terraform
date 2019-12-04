resource "aws_vpc" "New" {
  cidr_block       = "${var.VpcCIDR}"
  instance_tenancy = "default"
  tags = {
    Name        = "IntelSports"
    Environment = "${terraform.workspace}"
    Description = "VPC created by Terraform"
  }

}


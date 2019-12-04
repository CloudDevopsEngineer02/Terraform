locals {
  az_names = "${data.aws_availability_zones.azs.names}" # Data sources declaration for AZs.
}

data "aws_availability_zones" "azs" {
  state = "available"
}

resource "aws_subnet" "Public" {

  count             = "${length(local.az_names)}"
  vpc_id            = "${aws_vpc.New.id}"
  cidr_block        = "${cidrsubnet(var.VpcCIDR, 8, count.index )}" /* BuitInFucntions for dynamic CIDR from AWS.o/p: 10.20.1.0/24 [16+8] if cider subnet has been declared as "${cidrsubnet(10.100.0.0/16,4,3)" */
  availability_zone = "${local.az_names[count.index]}" # 0 mean very first AZ in the respective region and declared as locals since multiple repetatives.
  tags = {
    Name        = "PublicSubnet + ${count.index + 1}"
    Description = "PublicSubnets used for IntelSports N.Virginia VPC"
  }
}



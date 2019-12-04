
provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    key            = "Primary.tfstate"
    bucket         = "tf-20191127"
    dynamodb_table = "db_tbl"
    region         = "ap-south-1"


  }
}

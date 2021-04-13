resource "aws_vpc" "instituto-vpc" {
  cidr_block           = var.cidr_block_vpc
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "instituto-vpc"
  }
}

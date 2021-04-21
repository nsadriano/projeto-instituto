resource "aws_vpc" "VPC_CHALLENGE" {
  cidr_block           = var.vpcCIDRblock
  instance_tenancy     = var.instanceTenancy 
  enable_dns_support   = var.dnsSupport 
  enable_dns_hostnames = var.dnsHostNames
  tags = {
      Name = "VPC Challenge IA"
  }
}

resource "aws_subnet" "Public_subnet" {
  vpc_id                  = aws_vpc.VPC_CHALLENGE.id
  cidr_block              = var.publicsCIDRblock
  map_public_ip_on_launch = var.mapPublicIP 
  availability_zone       = var.availabilityZone
  tags = {
    Name = "Subnet Publica"
  }
}

resource "aws_network_acl" "Public_NACL" {
  vpc_id = aws_vpc.VPC_CHALLENGE.id
  subnet_ids = [ aws_subnet.Public_subnet.id ]
  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.publicdestCIDRblock 
    from_port  = 0
    to_port    = 0
  }
  
 
  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.publicdestCIDRblock
    from_port  = 0 
    to_port    = 0
  }
  
  tags = {
      Name = "Public NACL"
  }
}

resource "aws_internet_gateway" "IGW_Challenge" {
 vpc_id = aws_vpc.VPC_CHALLENGE.id
 tags = {
        Name = "Internet gateway Challenge"
  }
} 

resource "aws_route_table" "Public_RT" {
 vpc_id = aws_vpc.VPC_CHALLENGE.id
 tags = {
        Name = "Public Route table"
  }
} 

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.Public_RT.id
  destination_cidr_block = var.publicdestCIDRblock
  gateway_id             = aws_internet_gateway.IGW_Challenge.id
}

resource "aws_route_table_association" "Public_association" {
  subnet_id      = aws_subnet.Public_subnet.id
  route_table_id = aws_route_table.Public_RT.id
}

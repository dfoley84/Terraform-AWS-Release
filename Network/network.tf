resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cdir.web
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "VPC"
  }
}

data "aws_availability_zones" "azs_zones" {
  state = "available"
}

resource "aws_subnet" "public" {
  availability_zone = element(data.aws_availability_zones.azs_zones.names, 0 )
  cidr_block = var.subnet_cidr.public
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = "Public Subnet"
  }
}

resource "aws_subnet" "private" {
    availability_zone = element(data.aws_availability_zones.azs_zones.names, 0 )
    cidr_block = var.subnet_cidr.private
    vpc_id = aws_vpc.vpc.id
    tags = {
      "Name" = "Private Subnet"
    }
  }


resource "aws_internet_gateway" "vpc_igw" {
  vpc_id = aws_vpc.vpc.id
}


resource "aws_eip" "elastic_Nat" {
  vpc = true
  tags = {
    Name = "Nat Gateway Elastic IP"
  }
}

resource "aws_nat_gateway" "NAT" {
  allocation_id = aws_eip.elastic_Nat.id
  subnet_id = aws_subnet.public.id
  tags = {
    Name = "NAT GATEWAY"
  }
  depends_on = [aws_eip.elastic_Nat]
}

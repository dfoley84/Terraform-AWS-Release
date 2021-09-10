output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "vpc_igw_id"{
  value = aws_internet_gateway.vpc_igw.id
}

output "eip_id" {
  value = aws_eip.elastic_Nat.id
}

output "nat_id" {
  value = aws_nat_gateway.NAT.id
}
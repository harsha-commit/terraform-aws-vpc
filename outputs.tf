# VPC
output "vpc_id" {
  value = aws_vpc.main.id
}

# Subnets
output "public_subnets_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnets_ids" {
  value = aws_subnet.private[*].id
}

output "database_subnets_ids" {
  value = aws_subnet.database[*].id
}

# IGW
output "igw_id" {
  value = aws_internet_gateway.this.id
}

# NAT
output "nat_id" {
  value = aws_nat_gateway.this.id
}

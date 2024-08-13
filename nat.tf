### NAT Gateway ###
resource "aws_nat_gateway" "this" {
  subnet_id     = aws_subnet.public[0].id
  allocation_id = aws_eip.this.id

  tags = merge(local.common_tags, var.nat_tags, {
    Name = "${var.project_name}-${var.environment}-nat"
  })

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.this]
}

### Elastic IP Address ###
resource "aws_eip" "this" {
  domain = "vpc"
  tags = merge(local.common_tags, var.eip_tags, {
    Name = "${var.project_name}-${var.environment}-eip"
  })
}

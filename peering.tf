### VPC Peering ###
resource "aws_vpc_peering_connection" "this" {
  count  = var.is_peering_required ? 1 : 0
  vpc_id = aws_vpc.main.id

  auto_accept = var.peer_vpc_id == ""
  peer_vpc_id = local.target_vpc_id

  tags = merge(local.common_tags, var.peering_tags, {
    Name = "${var.project_name}-${var.environment}-peering"
  })
}

### Routes for Default VPC Peering Connection
resource "aws_route" "main_default" {
  count                     = var.is_peering_required && var.peer_vpc_id == "" ? 1 : 0
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.this[0].id
}

resource "aws_route" "default_main" {
  count                     = var.is_peering_required && var.peer_vpc_id == "" ? 1 : 0
  route_table_id            = data.aws_vpc.default.main_route_table_id
  destination_cidr_block    = aws_vpc.main.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.this[0].id
}

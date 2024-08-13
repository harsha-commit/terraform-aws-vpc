### Public Subnet ###
resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr_blocks)

  vpc_id            = aws_vpc.main.id
  availability_zone = local.azs_list[count.index]

  cidr_block              = var.public_subnet_cidr_blocks[count.index]
  map_public_ip_on_launch = true

  tags = merge(local.common_tags, var.public_subnet_tags, {
    Name = "${var.project_name}-${var.environment}-public-${local.azs_list[count.index]}"
  })
}

### Private Subnet ###
resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr_blocks)

  vpc_id            = aws_vpc.main.id
  availability_zone = local.azs_list[count.index]

  cidr_block = var.private_subnet_cidr_blocks[count.index]

  tags = merge(local.common_tags, var.private_subnet_tags, {
    Name = "${var.project_name}-${var.environment}-private-${local.azs_list[count.index]}"
  })
}

### Database Subnet ###
resource "aws_subnet" "database" {
  count = length(var.database_subnet_cidr_blocks)

  vpc_id            = aws_vpc.main.id
  availability_zone = local.azs_list[count.index]

  cidr_block = var.database_subnet_cidr_blocks[count.index]

  tags = merge(local.common_tags, var.database_subnet_tags, {
    Name = "${var.project_name}-${var.environment}-database-${local.azs_list[count.index]}"
  })
}

### DB Subnet Group ###
resource "aws_db_subnet_group" "this" {
  name       = "${var.project_name}-${var.environment}-db-subnet-group"
  subnet_ids = aws_subnet.database[*].id

  tags = merge(local.common_tags, var.db_subnet_group_tags, {
    Name = "${var.project_name}-${var.environment}-db-subnet-group"
  })
}

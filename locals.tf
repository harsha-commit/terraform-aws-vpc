locals {
  azs_list = data.aws_availability_zones.available.names
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    Terraform   = true
  }
  target_vpc_id = var.peer_vpc_id == "" ? data.aws_vpc.default.id : var.peer_vpc_id
}

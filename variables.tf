### Project Variables ###
variable "project_name" {
  type = string
}

variable "environment" {
  type    = string
  default = "dev"
}

### VPC Variables ###
variable "vpc_cidr_block" {
  type = string
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "enable_dns_support" {
  type    = bool
  default = true
}

variable "vpc_tags" {
  type    = map(any)
  default = {}
}

### Subnet Variables ###
variable "public_subnet_cidr_blocks" {
  type = list(string)
  validation {
    condition     = length(var.public_subnet_cidr_blocks) == 2
    error_message = "*** ERROR: THE LIST MUST HAVE ONLY 2 CIDR BLOCKS ***"
  }
}

variable "public_subnet_tags" {
  type    = map(any)
  default = {}
}

variable "private_subnet_cidr_blocks" {
  type = list(string)
  validation {
    condition     = length(var.private_subnet_cidr_blocks) == 2
    error_message = "*** ERROR: THE LIST MUST HAVE ONLY 2 CIDR BLOCKS ***"
  }
}

variable "private_subnet_tags" {
  type    = map(any)
  default = {}
}

variable "database_subnet_cidr_blocks" {
  type = list(string)
  validation {
    condition     = length(var.database_subnet_cidr_blocks) == 2
    error_message = "*** ERROR: THE LIST MUST HAVE ONLY 2 CIDR BLOCKS ***"
  }
}

variable "database_subnet_tags" {
  type    = map(any)
  default = {}
}

### EIP Variables ###
variable "eip_tags" {
  type    = map(any)
  default = {}
}

### IGW Variables ###
variable "igw_tags" {
  type    = map(any)
  default = {}
}

### NAT Variables ###
variable "nat_tags" {
  type    = map(any)
  default = {}
}

### RTB Variables ###
variable "public_route_table_tags" {
  type    = map(any)
  default = {}
}

variable "private_route_table_tags" {
  type    = map(any)
  default = {}
}

variable "database_route_table_tags" {
  type    = map(any)
  default = {}
}

### Peering Variables ###
variable "is_peering_required" {
  type = bool
}

variable "peer_vpc_id" {
  type    = string
  default = ""
}

variable "peering_tags" {
  type    = map(any)
  default = {}
}

variable "db_subnet_group_tags" {
  type    = map(any)
  default = {}
}

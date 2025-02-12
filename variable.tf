
//variable "aws_access_key" {}
//variable "aws_secret_key" {}
//variable "aws_region" {}

// VPC Name
variable "vpc_name" {
  type    = string
  default = "personal_vpc"
}

// VPC CIDR
variable "vpc_cidr" {
  type    = string
  default = "10.10.0.0/19"
}

// Avaiblity zones for subnets 
variable "avaiblity_zone" {
  type    = string
  default = "ap-south-1a"
}

// Public Subnet Name 
variable "public_subnet_name" {
  type    = string
  default = "public-subnet"
}

// Public Subnet CIDR
variable "public_subnet_cidr" {
  type    = string
  default = "10.10.1.0/24"
}

// Private Subnet Name
variable "private_subnet_name" {
  type    = string
  default = "private-subnet"
}

// Private Subnet CIDR
variable "private_subnet_cidr" {
  type    = string
  default = "10.10.5.0/24"
}

// Internet Gateway Name 
variable "internet_gateway_name" {
  type    = string
  default = "personal_internet_gateway"
}

// NAT Gateway Name 
variable "nat_gateway_name" {
  type    = string
  default = "personal_NAT_gateway"
}

// Elastic IP Name
variable "elastic_IP_name" {
  type    = string
  default = "per_NAT_gateway_IP"
}

// Public Route Name 
variable "public_route_name" {
  type    = string
  default = "public_route_table"
}

// Private Route Name 
variable "private_route_name" {
  type    = string
  default = "private_route_table"
}

// Public Security Group Name 
variable "public_security_group_name" {
  type    = string
  default = "public_security_group"
}

// Private Security Group Name 
variable "private_security_group_name" {
  type    = string
  default = "private_security_group"
}

// Private Key Name for EC2 instance 
variable "private_pam_key" {
  type    = string
  default = "<private pam key name>"
}
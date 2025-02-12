// VPC Creation
resource "aws_vpc" "vpc" {
 cidr_block = var.vpc_cidr
 tags = {
   Name = var.vpc_name
 }
}

// Public Subnet Creation 
resource "aws_subnet" "public-subnet" {
    vpc_id = "${aws_vpc.vpc.id}"
    cidr_block = var.public_subnet_cidr
    map_public_ip_on_launch = "false" 
    availability_zone = var.avaiblity_zone
    tags = {
        Name = var.public_subnet_name
    }
}

// Private Subnet Creation
resource "aws_subnet" "private-subnet" {
    vpc_id = "${aws_vpc.vpc.id}"
    cidr_block = var.private_subnet_cidr
    map_public_ip_on_launch = "false" 
    availability_zone = var.avaiblity_zone
    tags = {
        Name = var.private_subnet_name
    }
}

// Internet Gateway Creation
resource "aws_internet_gateway" "prod-igw" {
    vpc_id = "${aws_vpc.vpc.id}"
    tags = {
        Name = var.internet_gateway_name
    }
}

//Public Route Configuration 
resource "aws_route_table" "public-route" {
    vpc_id = "${aws_vpc.vpc.id}"
    route {
        cidr_block = "0.0.0.0/0" 
        gateway_id = "${aws_internet_gateway.prod-igw.id}" 
    }
    tags = {
        Name = var.public_route_name
    }
}

// Associat Route table to public subnet
resource "aws_route_table_association" "public-route-to-public-subnet"{
    subnet_id = "${aws_subnet.public-subnet.id}"
    route_table_id = "${aws_route_table.public-route.id}"
}

// Create a Elastic IP For NAT Gateway 
resource "aws_eip" "elastic_IP" {
    domain = "vpc"
    tags = {
        Name = var.elastic_IP_name
    }
}

// Create NAT Gateway 
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id                  = aws_eip.elastic_IP.id
  subnet_id                      = aws_subnet.public-subnet.id
  tags = {
        Name = var.nat_gateway_name
    }
}

// Private route configuration 
resource "aws_route_table" "private-route" {
    vpc_id = "${aws_vpc.vpc.id}"
    route {
        cidr_block = "0.0.0.0/0" 
        gateway_id = "${aws_nat_gateway.nat_gateway.id}" 
    }
    tags = {
        Name = var.private_route_name
    }
}

// Associat private route table to private subnet
resource "aws_route_table_association" "private-route-config"{
    subnet_id = "${aws_subnet.private-subnet.id}"
    route_table_id = "${aws_route_table.private-route.id}"
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public-subnet" {
  value = aws_subnet.public-subnet.id
}


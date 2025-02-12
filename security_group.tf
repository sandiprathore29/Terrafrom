// Public security group creation 
resource "aws_security_group" "prod_public_sg" {
    name = var.public_security_group_name
    vpc_id = "${aws_vpc.vpc.id}"
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = var.public_security_group_name
    }
}


// Private security group creation 
resource "aws_security_group" "prod_private_sg" {
    name = var.private_security_group_name
    vpc_id = "${aws_vpc.vpc.id}"
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["10.10.1.0/24"]
    }
    tags = {
        Name = var.private_security_group_name
    }
}
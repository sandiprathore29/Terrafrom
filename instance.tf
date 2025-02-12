resource "aws_instance" "bastion-host-server" {
  ami           = "ami-0ad21ae1d0696ad58"
  instance_type = "t2.micro"
  key_name = var.private_pam_key
  subnet_id = aws_subnet.public-subnet.id
  associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.prod_public_sg.id]
  tags = {
    Name = "bastion-host"
  }
}

output "bastion-host-public-id" {
  value = aws_instance.bastion-host-server.id
}


resource "aws_instance" "db-server" {
  ami           = "ami-0ad21ae1d0696ad58"
  instance_type = "t2.micro"
  key_name = var.private_pam_key
  subnet_id = aws_subnet.private-subnet.id
  vpc_security_group_ids = [aws_security_group.prod_private_sg.id]
  tags = {
    Name = "BackEnd_Server"
  }
}

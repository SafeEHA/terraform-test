resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_vpc" "simple_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "SimpleVPC"
  }
}

resource "aws_subnet" "simple_subnet" {
  vpc_id                  = aws_vpc.simple_vpc.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "SimpleSubnet"
  }
}

resource "aws_security_group" "simple_sg" {
  vpc_id = aws_vpc.simple_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_allowed_cidr]
  }

  tags = {
    Name = "SimpleSG"
  }
}

resource "aws_instance" "simple_instance" {
  ami           = var.ubuntu_ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.simple_subnet.id
  key_name      = var.key_name

  vpc_security_group_ids       = [aws_security_group.simple_sg.id]
  associate_public_ip_address  = true

  tags = {
    Name = "SimpleInstance"
  }
}
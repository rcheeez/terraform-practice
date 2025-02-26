resource "aws_default_vpc" "default_vpc" {
  
}

resource "aws_key_pair" "mykey" {
  key_name = var.aws_key_name
  public_key = file("/home/archiesgurav10/.ssh/terra-key.pub")
}

resource "aws_security_group" "allow_ssh" {
  vpc_id = aws_default_vpc.default_vpc.id
  name = var.sg_name

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg_name
  }
}

resource "aws_instance" "myinstance" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.mykey.key_name
  security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "terra-automate-instance"
  }
}


data "aws_ami" "ubuntu-server" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "docker-challenge" {
  ami                    = data.aws_ami.ubuntu-server.id
  instance_type          = "t2.medium"
  key_name               = var.keyname
  subnet_id              = aws_subnet.Public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg_allow_access-challenge.id]

  root_block_device {
    volume_size = "40"
    volume_type = "standard"
  }

  associate_public_ip_address = true

  tags = {
    Name = "instancia-docker-challenge"
  }
}

resource "aws_security_group" "sg_allow_access-challenge" {
  name        = "Allow Traffic SG Challenge"
  description = "Allow ssh and standard 80/8080 ports inbound and everything outbound"
  vpc_id      = aws_vpc.VPC_CHALLENGE.id

  dynamic "ingress" {
    iterator = port
    for_each = var.proxy-ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Terraform" = "true"
  }
}

output "docker_ip_address" {
  value = aws_instance.docker-challenge.public_dns
}

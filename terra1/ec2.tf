data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "custom-ubuntu"
    values = ["*ubuntu2404-cloud*"]
  }

  filter {
        name = "architecture"
        values = ["x86_64"]
    }
}

# Создаем Security Group в нашей VPC
resource "aws_security_group" "ping_sg" {
  name        = "allow_ping_and_ssh"
  description = "Allow ICMP (ping) and SSH inbound traffic"

  # Ссылаемся на VPC, созданную модулем
  vpc_id      = module.vpc.vpc_id

  # Разрешаем PING (ICMP) откуда угодно
  ingress {
    description = "Allow Ping"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Разрешаем весь исходящий трафик
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ping-sg"
  }
}

# Создаем саму EC2-машину
resource "aws_instance" "test_vm" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  # Помещаем машину в первую публичную подсеть из нашего модуля VPC
  subnet_id                   = module.vpc.public_subnets[0]

  # Привязываем Security Group
  vpc_security_group_ids      = [aws_security_group.ping_sg.id]

  # Включаем публичный IP, чтобы мы могли пинговать её снаружи
  associate_public_ip_address = true

  tags = {
    Name = "test-vpc-vm"
  }
}
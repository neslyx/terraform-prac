resource "aws_instance" "app" {
  ami           = "ami-amazonlinux2023"
  instance_type = "t2.micro"

  subnet_id = data.terraform_remote_state.vpc.outputs.subnet_ids[0]

  associate_public_ip_address = true

  tags = {
    Name = "prod-trainee-project-ec2"
  }
}

output "instance_id" {
  value = aws_instance.app.id
}

output "private_ip" {
  value = aws_instance.app.private_ip
}

output "public_ip" {
  value = aws_instance.app.public_ip
}

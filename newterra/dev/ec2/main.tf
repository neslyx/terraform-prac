resource "aws_instance" "app" {
  ami           = "ami-amazonlinux2023"
  instance_type = "t2.micro"

  subnet_id = data.terraform_remote_state.vpc.outputs.subnet_ids[0]

  associate_public_ip_address = true

  tags = {
    Name = "dev-trainee-project-ec2"
  }
}

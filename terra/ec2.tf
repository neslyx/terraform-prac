data "aws_ami" "ubuntu" {
    owners = ["099720109477"]
    most_recent = true

    filter {
        name = "my-custom-ubuntu"
        values = ["*ubuntu2404-cloud*"]
    }
    filter {
        name = "architecture"
        values = ["x86_64"]
    }
}

locals {
    name_prefix = "${var.project_name}-${var.env}"
}

resource "aws_instance" "ec2" {
    for_each = var.instance_configs
    ami           = data.aws_ami.ubuntu.id
    instance_type = each.value
    user_data = file("${path.module}/user-data.sh")

    lifecycle {
        ignore_changes = [user_data]
    }

    tags = {
        Name = "${local.name_prefix}-${each.key}-ec2"
    }
}
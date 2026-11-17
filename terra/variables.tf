variable "region" {
  type = string
  description = "AWS region"
  default = "eu-north-1"
}

variable "project_name" {
  type = string
  description = "Project name"
  default = "trainee project"
}

variable "env" {
  type = string
  description = "Environment"
}

variable "instance_configs" {
  type = map(string)
  default = {
    "backend" = "t3.micro"
    "frontend" = "t2.micro"
  }
}

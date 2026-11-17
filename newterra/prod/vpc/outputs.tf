output "vpc_id" {
  description = "Production VPC ID"
  value       = module.vpc.vpc_id
}

output "subnet_ids" {
  description = "Production public subnet IDs"
  value       = module.vpc.subnet_ids
}

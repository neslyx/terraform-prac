output "vpc_id" {
  description = "Development VPC ID"
  value       = module.vpc.vpc_id
}

output "subnet_ids" {
  description = "Development public subnet IDs"
  value       = module.vpc.subnet_ids
}

output "aws_region" {
  description = "Configured AWS region"
  value       = var.aws_region
}

output "deployment_environment" {
  description = "Active Terraform workspace"
  value       = terraform.workspace
}

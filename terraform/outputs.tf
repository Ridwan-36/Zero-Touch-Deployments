
output "aws_region" {
  description = "Configured AWS region"
  value       = var.aws_region
}

output "deployment_environment" {
  description = "Active Terraform workspace"
  value       = terraform.workspace
}

output "ecr_repository_url" {
  description = "ECR repository URL"
  value       = data.aws_ecr_repository.app.repository_url
}

output "ecs_cluster_name" {
  description = "ECS cluster name"
  value       = module.compute.ecs_cluster_name
}

output "ecs_service_name" {
  description = "ECS service name"
  value       = module.compute.ecs_service_name
}

output "load_balancer_dns" {
  description = "Application Load Balancer DNS"
  value       = module.compute.load_balancer_dns
}

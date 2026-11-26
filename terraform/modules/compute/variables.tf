variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
}

variable "aws_region" {
  description = "AWS region for ECS resources"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for ECS and ALB"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "Security group ID for the ALB"
  type        = string
}

variable "ecs_security_group_id" {
  description = "Security group ID for ECS tasks"
  type        = string
}

variable "container_port" {
  description = "Application container port"
  type        = number
  default     = 80
}

variable "desired_count" {
  description = "Desired number of ECS tasks"
  type        = number
  default     = 2
}

variable "vpc_id" {
  description = "VPC ID for the ALB target group"
  type        = string
}


variable "image_tag" {
  description = "Docker image tag deployed to ECS"
  type        = string
  default     = "latest"
}

variable "ecr_repository_url" {
  description = "Existing ECR repository URL for the ECS application"
  type        = string
}

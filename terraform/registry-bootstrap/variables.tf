
variable "aws_region" {
  description = "AWS region for ECR"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name used for ECR naming"
  type        = string
  default     = "zero-touch-deployments"
}

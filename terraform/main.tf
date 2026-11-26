
data "aws_ecr_repository" "app" {
  name = "${var.project_name}-${terraform.workspace}"
}

module "networking" {
  source = "./modules/networking"

  project_name        = var.project_name
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
}

module "security" {
  source = "./modules/security"

  project_name = var.project_name
  vpc_id       = module.networking.vpc_id
}

module "compute" {
  source = "./modules/compute"

  project_name          = var.project_name
  image_tag             = var.image_tag
  ecr_repository_url    = data.aws_ecr_repository.app.repository_url
  aws_region            = var.aws_region
  vpc_id                = module.networking.vpc_id
  public_subnet_ids     = module.networking.public_subnet_ids
  alb_security_group_id = module.security.alb_security_group_id
  ecs_security_group_id = module.security.ecs_security_group_id
}

module "monitoring" {
  source = "./modules/monitoring"

  project_name = var.project_name
  cluster_name = module.compute.ecs_cluster_name
  service_name = module.compute.ecs_service_name
}

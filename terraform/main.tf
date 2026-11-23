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
}

module "monitoring" {
  source = "./modules/monitoring"
}

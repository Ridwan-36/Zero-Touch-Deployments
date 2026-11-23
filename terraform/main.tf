module "networking" {
  source = "./modules/networking"

  project_name        = var.project_name
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
}

module "security" {
  source = "./modules/security"
}

module "compute" {
  source = "./modules/compute"
}

module "monitoring" {
  source = "./modules/monitoring"
}

module "networking" {
  source = "./modules/networking"
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

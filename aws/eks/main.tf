module "network" {
  source       = "../modules/network"
  name         = "kubernetes-development"
  az           = ["a", "b"]
  vpc_cidr     = "10.0.0.0/16"
  subnets_cidr = ["10.0.1.0/24", "10.0.2.0/24"]
}

module "eks" {
  source          = "../modules/eks"
  name            = "development"
  vpc_id          = module.network.vpc_id
  subnets         = module.network.subnet
  min_nodes       = 1
  max_nodes       = 3
  number_of_nodes = 2
  instance_types  = ["t3.large"]
}
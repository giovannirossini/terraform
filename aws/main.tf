module "route53" {
  source = "./route53/"
  domain_name = "example.com"
}

module "certificate-manager" {
  source  = "./acm"
  zone_id = module.route53.zone_id
  domain  = "example.com"
}

module "efs" {
  source        = "./efs"
  name          = "production"
  subnets       = [for i in module.network.subnet: i]
  sg_id         = [module.network.sg_efs_id]
}

module "rds" {
  source          = "./rds"
  name            = "production"
  db_name         = "test"
  db_user         = "admin"
  instance_class  = "db.t3.small"
  subnets         = module.network.subnet
  sg_id           = module.network.sg_rds_id
}

module "elasticache" {
  source        = "./elasticache"
  subnet        = module.network.subnet
  sg_id         = module.network.sg_redis_id
}

module "elasticsearch" {
  source          = "./elasticsearch"
  domain          = "es-production"
  instance_type   = "t3.small.search"
  instance_count  = 1
  subnet          = element(module.network.subnet,0)
  sg_id           = module.network.sg_elasticsearch_id
  ebs_size        = 10
}

module "network" {
  source        = "./network"
  name          = "vpc-production"
  az            = ["a","b","c"]
  vpc_cidr      = "100.0.0.0/16"
  subnets_cidr  = ["100.0.0.0/20","100.0.16.0/20","100.0.32.0/20"]
}

module "ec2" {
  source            = "./ec2"
  name              = "application"
  instance_type     = "t3a.micro"
  volume_size       = 8
  subnet_id         = module.network.subnet[0]
  sg_id             = module.network.sg_default_id
  instances_number  = 4
}

module "loadbalancer" {
  source        = "./alb"
  name          = "frontend"
  instance_id   = [for i in module.backend.ec2_id : i]
  sg_id         = [module.network.sg_alb_id]
  vpc_id        = module.network.vpc_id
  subnets       = module.network.subnet
}
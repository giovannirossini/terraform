resource "aws_elasticache_subnet_group" "subnet" {
  name       = "cache-subnet"
  subnet_ids = var.subnet
}

resource "aws_elasticache_cluster" "redis" {
  depends_on            = [aws_elasticache_subnet_group.subnet]
  cluster_id            = var.name
  engine                = var.engine
  node_type             = var.instance_type
  num_cache_nodes       = var.number_of_nodes
  parameter_group_name  = var.parameter_group
  engine_version        = var.engine_version
  port                  = var.port
  security_group_ids    = [var.sg_id]
  subnet_group_name     = aws_elasticache_subnet_group.subnet.id
}
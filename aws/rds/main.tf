data "aws_region" "current" {}

resource "aws_db_subnet_group" "default" {
  name       = "db_subnet_group"
  subnet_ids = var.subnets

  tags = {
    Name = "DB subnet group"
  }
}

resource "aws_rds_cluster" "cluster" {
  cluster_identifier      = var.name
  engine                  = var.engine
  engine_version          = var.engine_version
  availability_zones      = [join("", ["${data.aws_region.current.name}","${element(var.az,0)}"])]
  vpc_security_group_ids  = [var.sg_id]
  db_subnet_group_name    = aws_db_subnet_group.default.name
  port                    = var.port
  database_name           = var.db_name
  master_username         = var.db_user
  master_password         = random_password.password.result
  engine_mode             = var.mode
  deletion_protection     = var.protection
  backup_retention_period = var.retention_period
  preferred_backup_window = var.maintenance
}

resource "aws_rds_cluster_instance" "instances" {
  depends_on              = [aws_rds_cluster.cluster]
  count                   = length(var.az)
  identifier              = var.name
  cluster_identifier      = aws_rds_cluster.cluster.id
  instance_class          = var.instance_class
  engine                  = aws_rds_cluster.cluster.engine
  engine_version          = aws_rds_cluster.cluster.engine_version
  availability_zone       = join("", ["${data.aws_region.current.name}","${element(var.az,count.index)}"])
}
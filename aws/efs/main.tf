resource "aws_efs_file_system" "efs_production" {
  performance_mode  = var.mode
  encrypted         = var.encrypted
  throughput_mode   = var.throughput_mode
  tags              = {
    Name            = var.name
  }
}

resource "aws_efs_mount_target" "production" {
  count = length(var.subnets)
  file_system_id  = aws_efs_file_system.efs_production.id
  subnet_id       = element(var.subnets,count.index)
  security_groups = var.sg_id
}
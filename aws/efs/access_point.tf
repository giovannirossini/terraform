resource "aws_efs_access_point" "access_point" {
  file_system_id = aws_efs_file_system.efs_production.id
  root_directory {
    path           = var.root_path
  }
  tags = {
    Name        = var.name
  }
}
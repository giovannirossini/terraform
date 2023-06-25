resource "aws_db_instance" "rds_instance" {
  engine              = "mysql"
  instance_class      = "db.t2.micro"
  allocated_storage   = 8
  storage_type        = "gp2"
  username            = "db_username" # Replace with your desired database username
  password            = "db_password" # Replace with your desired database password
  db_name             = "db_name"     # Replace with your desired database name
  publicly_accessible = false

  tags = {
    Name = "rds_instance"
  }
}

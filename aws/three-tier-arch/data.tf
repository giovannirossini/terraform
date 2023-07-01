# module "mysql" {
#   source              = "git@github.com:giovannirossini/terraform.git//aws/modules/rds"
#   name                = local.name
#   db_name             = "test"
#   db_user             = "admin"
#   db_password         = "admin123"
#   instance_class      = "db.t3.small"
#   subnets             = module.network.private_subnet
#   sg_id               = aws_security_group.sg_rds.id
#   skip_final_snapshot = true
#   publicly_accessible = false
#   protection          = false
# }

# # resource "aws_db_instance" "test-replica" {
# #   count                      = length(module.mysql.az)
# #   replicate_source_db        = "${module.mysql.id}-${count.index}"
# #   replica_mode               = "mounted"
# #   auto_minor_version_upgrade = false
# #   backup_retention_period    = 7
# #   identifier                 = "${module.mysql.id}-${count.index}-replica"
# #   instance_class             = "db.t3.small"
# #   multi_az                   = true
# #   skip_final_snapshot        = true
# #   storage_encrypted          = true

# #   timeouts {
# #     create = "3h"
# #     delete = "3h"
# #     update = "3h"
# #   }
# # }

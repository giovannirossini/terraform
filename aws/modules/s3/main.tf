resource "aws_s3_bucket" "bucket" {
  bucket = var.name
  acl    = var.acl
  tags   = var.tags
  versioning {
    enabled = var.versioning_enabled
  }
}

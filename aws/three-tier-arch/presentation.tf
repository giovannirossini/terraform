# Create S3 bucket for hosting the website
resource "aws_s3_bucket" "presentation_bucket" {
  bucket = "my-website-bucket-for-three-tier-arch" # Update with your desired bucket name
}

resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.presentation_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "access_block" {
  bucket = aws_s3_bucket.presentation_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.ownership,
    aws_s3_bucket_public_access_block.access_block,
  ]

  bucket = aws_s3_bucket.presentation_bucket.id
  acl    = "public-read"
}

# Configure S3 bucket policy to allow public access
resource "aws_s3_bucket_policy" "presentation_bucket_policy" {
  bucket = aws_s3_bucket.presentation_bucket.id

  policy = templatefile("${path.module}/templates/s3.json", {
    bucket = aws_s3_bucket.presentation_bucket.id
  })
}

resource "aws_s3_bucket_website_configuration" "web" {
  bucket = aws_s3_bucket.presentation_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.presentation_bucket.id
  key    = "index.html"
  source = "${path.module}/src/s3/index.html"
  # templatefile("${path.module}/src/s3/index.html", {
  #   lambda_name = aws_lambda_function_url.backend_lambda_latest.function_url
  # })

  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.presentation_bucket.id
  key          = "error.html"
  source       = "${path.module}/src/s3/error.html"
  content_type = "text/html"
}

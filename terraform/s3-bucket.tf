resource "aws_s3_bucket" "develop_bucket" {
  bucket = "front-end-develop"
  acl    = "public-read"

  website {
    index_document = "index.html"
  }
}

resource "aws_s3_bucket" "staging_bucket" {
  bucket = "front-end-staging"
  acl    = "public-read"

  website {
    index_document = "index.html"
  }
}

resource "aws_s3_bucket" "production_bucket" {
  bucket = "front-end-production"
  acl    = "public-read"

  website {
    index_document = "index.html"
  }
}

# Se configura el acceso publico a la URL
resource "aws_s3_bucket_public_access_block" "develop_block" {
  bucket = aws_s3_bucket.develop_bucket.bucket

  block_public_acls   = false
  block_public_policy = false
  ignore_public_acls  = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_public_access_block" "staging_block" {
  bucket = aws_s3_bucket.staging_bucket.bucket

  block_public_acls   = false
  block_public_policy = false
  ignore_public_acls  = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_public_access_block" "production_block" {
  bucket = aws_s3_bucket.production_bucket.bucket

  block_public_acls   = false
  block_public_policy = false
  ignore_public_acls  = false
  restrict_public_buckets = false
}
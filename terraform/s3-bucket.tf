provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "develop_s3_bucket" {
  bucket = "react-develop-bucket"

  tags = {
    Name        = "react-develop-bucket"
  }
}

resource "aws_s3_bucket" "staging_s3_bucket" {
  bucket = "react-staging-bucket"

  tags = {
    Name        = "react-staging-bucket"
  }
}

resource "aws_s3_bucket" "production_s3_bucket" {
  bucket = "react-production-bucket"

  tags = {
    Name        = "react-production-bucket"
  }
}
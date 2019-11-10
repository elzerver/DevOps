provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "SandBox"

  versioning {
      enabled  = true
  }

  lifecycle {
      prevent_destroy = true
  }

  tags {
    Name = "S3 terraform State Store"
  }
}


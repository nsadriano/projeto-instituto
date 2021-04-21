resource "aws_s3_bucket" "terraform_state" {
  bucket = "s3-bucket-projeto-instituto-b"
  
  versioning {
    enabled = true
  }
  
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_lockin" {
  name         = "db-projeto-instituto-lock"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

terraform {
  backend "s3" {
    bucket         = "s3-bucket-projeto-instituto-b"
    key            = "s3/terraform.tfstate"
    dynamodb_table = "db-projeto-instituto-lock"
    region = "us-east-1"
  }
}
resource "aws_s3_bucket" "terraform_state" {
  bucket = "s3-bucket-projeto-IA"
  
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

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "db-projeto-IA-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

terraform {
  backend "s3" {
    bucket         = "s3-bucket-projeto-IA"
    key            = "s3/terraform.tfstate"
    dynamodb_table = "db-projeto-IA-locks"
    region = "us-east-1"
  }
}
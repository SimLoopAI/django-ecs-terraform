resource "aws_s3_bucket" "terraform_state" {
  bucket = "simloop-terraform"
  acl    = "private"

  versioning {
    enabled = true
  }

  force_destroy = false

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Production"
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name           = "terraform-locks"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Terraform Locks Table"
    Environment = "Production"
  }
}

terraform {
  backend "s3" {
    bucket = "simloop-terraform"
    key            = "state/production/terraform.tfstate"
    region         = "us-west-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}


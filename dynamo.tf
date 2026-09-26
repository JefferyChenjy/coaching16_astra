resource "aws_dynamodb_table" "urls" {
  name         = "${var.project_name}-urls"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "short_id"
 
  attribute {
    name = "short_id"
    type = "S"
  }
 
  # Optional expiry: set an "expires_at" epoch attribute on items to auto-delete them
  ttl {
    attribute_name = "expires_at"
    enabled        = true
  }
 
  point_in_time_recovery {
    enabled = true
  }
 
  server_side_encryption {
    enabled = true
  }
}
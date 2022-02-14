resource "random_integer" "rand" {
  min = 10000
  max = 99999
}

locals {
  common_tags = {
    company       = var.org_name
    project_name  = var.project_name
    project_code  = var.project_code
   }

   bucket_name         = lower("${var.aws_bucket_prefix}-${random_integer.rand.result}")
   datalog_bucket_name = lower("${var.aws_bucket_prefix}-${random_integer.rand.result}")
   dynamodb_table_name = "${var.aws_dynamodb_table}-${random_integer.rand.result}"
   
}
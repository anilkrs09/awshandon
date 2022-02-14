terraform {
    backend "s3" {
        bucket         = "spark-33752"
        region         = "us-east-1"
        key            = "networking/terraform.tfstate"
        dynamodb_table = "spark-tfstatelock-33752"
        encrypt        = true   
    }
}
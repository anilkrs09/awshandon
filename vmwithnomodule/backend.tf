terraform {
    backend "s3" {
        bucket         = "spark-49509"
        region         = "us-east-1"
        key            = "networking/terraform.tfstate"
        dynamodb_table = "spark-tfstatelock-49509"
        encrypt        = true   
    }
}
terraform {
    backend "s3" {
        encrypt = true
        bucket = "Sandbox"
        region = "us-east-1"
        key = ".terraform.tfstate"
    }
}
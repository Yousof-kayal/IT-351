terraform {
    required_version = ">= 0.14"
    backend "s3" { }
}

provider "aws" {
    region = "us-east-1"
}

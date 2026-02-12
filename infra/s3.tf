terraform {
    backend "s3" {
    bucket         	   = "threat-composer-state"
    key              	   = "prod/terraform.tfstate"
    region         	   = "eu-west-2"
    encrypt        	   = true
    dynamodb_table = "threat-composer-lock"
  }
}

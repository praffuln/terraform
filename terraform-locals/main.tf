provider "aws" {
   region     = "ap-south-1"
   shared_credentials_files = ["C:\\Users\\hp\\.aws\\credentials"]
   profile                 = "default"
}

locals {
   staging_env = "staging"
}

resource "aws_instance" "ec2_example" {
   
   ami           = "ami-0d81306eddc614a45"
   instance_type = "t2.micro"
   
   tags = {
           Name = "${local.staging_env}-ec2-tag"
   }
}

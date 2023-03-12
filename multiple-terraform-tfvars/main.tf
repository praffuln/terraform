provider "aws" {
   region     = "ap-south-1"
   shared_credentials_files = ["C:\\Users\\hp\\.aws\\credentials"]
   profile                 = "default"
}

resource "aws_instance" "ec2_example" {
   
   ami           = "ami-0d81306eddc614a45"
   instance_type = var.instance_type
   
   tags = {
           Name = var.environment_name
   }
}

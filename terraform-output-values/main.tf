provider "aws" {
   region     = "ap-south-1"
   shared_credentials_files = ["C:\\Users\\hp\\.aws\\credentials"]
   profile                 = "default"
}

resource "aws_instance" "ec2_example" {
   
   ami           = "ami-0d81306eddc614a45"
   instance_type = "t2.micro"
   
   tags = {
           Name = "staging-ec2-tag"
   }
}

output "random_value" {
   value = "hello world random_value"
}  

output "public_id_ec2" {
   value = aws_instance.ec2_example.public_ip
}  

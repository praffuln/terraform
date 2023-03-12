provider "aws" {
   region     = "ap-south-1"
   access_key = "AKIAX42IIBGDDHP3YSFJ"
   secret_key = "ni1I2krL0kWqGCZO+sBy+RRKfnTgxP57nA05f2Xi"
}

resource "aws_instance" "ec2_example" {
   
   ami           = "ami-0d81306eddc614a45"
   instance_type = var.instance_type
   
   tags = {
           Name = "Terraform EC2"
   }
}

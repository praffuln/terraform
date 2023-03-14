resource "aws_instance" "ec2_example" {
   
   ami           = "ami-0d81306eddc614a45"
   instance_type = "t2.micro"
   
   tags = {
           Name = "Terraform EC2 - From Module 1"
   }
}

provider "aws" {
  region                   = "ap-south-1"
  shared_credentials_files = ["C:\\Users\\hp\\.aws\\credentials"]
  profile                  = "default"
}

terraform {
   backend "s3" {
     bucket = "terraform-state"
     key = "key/terraform.tfstate"
     region = "eu-central-1"
   }
}

locals {
  instance_name = "${terraform.workspace}-instance"
}

resource "aws_instance" "ec2_example" {

  ami = "ami-0767046d1677be5a0"

  instance_type = "t2.micro"

  tags = {
    Name = "Terraform EC2"
  }
}

data "aws_instance" "myawsinstance" {
  filter {
    name   = "tag:Name"
    values = ["Terraform EC2"]
  }

  depends_on = [
    "aws_instance.ec2_example"
  ]
}


output "fetched_info_from_aws" {
  value = data.aws_instance.myawsinstance
}

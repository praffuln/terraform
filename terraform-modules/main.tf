provider "aws" {
   region     = "ap-south-1"
   shared_credentials_files = ["C:\\Users\\hp\\.aws\\credentials"]
   profile                 = "default"
}


module "first-ec2-instance" {
  source = ".//Module1"
}

module "second-ec2-instance" {
  source = ".//Module2"
}

provider "aws" {
   region     = "ap-south-1"
   shared_credentials_files = ["C:\\Users\\hp\\.aws\\credentials"]
   profile                 = "default"
}


module "jhooq-webserver-1" {
  source = ".//module-1"
}

module "jhooq-webserver-2" {
  source = ".//module-2"
}

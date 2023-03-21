provider "aws" {
  region                   = "ap-south-1"
  shared_credentials_files = ["C:\\Users\\hp\\.aws\\credentials"]
  profile                  = "default"
}

### Start - Glue Network Connection ################################

# fetch all availability zones
data "aws_availability_zones" "availability_zones" {
  state = "available"
}

# Fetch aws_security_group with name defaults
data "aws_security_group" "security_group" {
  name = "default"
}

data "aws_subnet" "subnet" {
   availability_zone = data.aws_availability_zones.availability_zones.names[0]
}


resource "aws_glue_connection" "glue_connection" {

  name            = "glue-connection-${var.use-case.env}-customer-credit-01"
  connection_type = "NETWORK"

  physical_connection_requirements {
    availability_zone      = data.aws_availability_zones.availability_zones.names[0]
    security_group_id_list = [data.aws_security_group.security_group.id]
    subnet_id              =  data.aws_subnet.subnet.id
  }
}

### End - Glue Network Connection ################################

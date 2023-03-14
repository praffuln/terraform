provider "aws" {
   region     = "ap-south-1"
   shared_credentials_files = ["C:\\Users\\hp\\.aws\\credentials"]
   profile                 = "default"
}

resource "aws_iam_user" "iam_users_count" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}

#this works only with set and map
resource "aws_iam_user" "iam_users_for-each" {
  for_each = var.user_names_set
  name  = each.value
}



variable "user_names" {
  description = "IAM usernames"
  type        = list(string)
  default     = ["user1", "user2", "user3"]
}

variable "user_names_set" {
  description = "IAM usernames"
  type        = set(string)
  default     = ["user4", "user5", "user6"]
}

variable "user_names_for_loop" {
  description = "IAM usernames"
  type        = list(string)
  default     = ["user7", "user8", "user9"]
}

output "print_the_names" {
  value = [for name in var.user_names : name]
}
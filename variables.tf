variable "region" {
  description = "Define what region the instance will be deployed"
  default     = "us-east-1"
}

variable "repo" {
  description = "Repository of the application"
  default     = "https://github.com/danitorelli/terraform.git"
}

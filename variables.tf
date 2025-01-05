variable "key_name" {
  description = "The name of the SSH key to use for accessing nodes"
  type        = string
}

variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

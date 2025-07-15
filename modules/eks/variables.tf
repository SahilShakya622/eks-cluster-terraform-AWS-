variable "vpc_id" {
  description = "VPC ID for EKS"
  type        = string
}

variable "subnet_ids" {
  description = "List of private subnet IDs for EKS"
  type        = list(string)
}

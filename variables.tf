variable "region" {
  description = "Enter the desired region: "
  type        = string
  default     = "us-east-1"
}

variable "VpcCIDR" {
  description = "Enter the CIDR range"
  type        = string
  default     = "10.20.0.0/16"
}


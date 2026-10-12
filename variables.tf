
variable "aws_region" {
  description = "AWS region for the lab"
  type        = string
  default     = "us-east-1"
}

variable "floci_endpoint" {
  description = "Floci local AWS emulator endpoint"
  type        = string
  default     = "http://localhost:4566"
}

variable "environment" {
  description = "Deployment environment"
  type        = string

  validation {
    condition = contains(
      ["dev", "stg", "prod"],
      var.environment
    )
    error_message = "Environment must be dev, stg, or prod."
  }
}

variable "vpc_cidr" {
  description = "CIDR range for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR range for the public subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
  default     = "us-east-1a"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID accepted by the simulator"
  type        = string
}

variable "bucket_name" {
  description = "Globally unique S3 bucket name within the simulator"
  type        = string
}

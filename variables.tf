variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "ap-south-1" # Example for Mumbai
}

variable "project_name" {
  description = "Prefix for resource naming"
  type        = string
  default     = "MyWebApp"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance (e.g., Ubuntu 22.04 LTS)"
  type        = string
  default     = "ami-0f5ee92e6d6491500" # Example for Ubuntu 22.04 LTS in ap-south-1
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_pair_name" {
  description = "Name of the existing SSH key pair in AWS"
  type        = string
  # IMPORTANT: Replace with your actual key pair name
  default     = "my-ansible-key"
}

variable "vpc_id" {
  description = "ID of the VPC to deploy into"
  type        = string
  # IMPORTANT: Replace with your actual VPC ID
  default     = "vpc-0123456789abcdef0"
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed for SSH access"
  type        = string
  # IMPORTANT: Replace with your public IP for security
  default     = "0.0.0.0/0" # WARNING: Highly insecure for production!
}

variable "instance_ssh_user" {
  description = "Default SSH user for the AMI (e.g., ubuntu, ec2-user)"
  type        = string
  default     = "ubuntu"
}

variable "ansible_ssh_private_key_path" {
  description = "Local path to the private SSH key file for Ansible"
  type        = string
  # IMPORTANT: Replace with the actual path to your private key
  default     = "~/.ssh/my-ansible-key.pem"
}
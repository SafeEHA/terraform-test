variable "aws_region" {
  description = "AWS region to deploy resources in"
  default     = "eu-west-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  default     = "10.0.1.0/24"
}

variable "ssh_allowed_cidr" {
  description = "CIDR block that is allowed SSH access"
  default     = "0.0.0.0/0"
}

variable "ubuntu_ami" {
  description = "AMI ID of the Ubuntu instance. This will vary based on the region."
  default     = "ami-0694d931cee176e7d"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the AWS key pair"
  default     = "my-key-pair"
}

variable "public_key_path" {
  description = "Path to the public key file"
  default     = "~/.ssh/id_ed25519.pub"
}
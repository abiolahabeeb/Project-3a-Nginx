variable "aws_region" {
  type        = string
  description = "AWS Region declared"
}

variable "instance_type" {
  type        = string
  description = "Type of instance deploy"
}

variable "instance_ami" {
  type        = string
  description = "id of the AMI"
}

variable "ec2_key_pair" {
  type        = string
  description = "Key to access the EC2 instance"
  default     = "nginx-deployemnt"
}

variable "private_key_path" {

}

variable "tag_name" {
  type        = string
  description = "Name of the instance"
}

variable "tag_name_sg" {
  type        = string
  description = "Name of the security group"
}

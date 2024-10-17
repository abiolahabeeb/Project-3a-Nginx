# Instance public ip
output "instance_ip" {
  value = aws_instance.ec2.public_ip
}

# Instance name
output "instance_name" {
  value = aws_instance.ec2.tags["Name"]
}

# Public DNS
output "aws_instance_public_dns" {
  value = aws_instance.ec2.public_dns
}

# print the url of the jenkins server
output "website_url" {
  value = join("", ["http://", aws_instance.ec2.public_dns, ":", "8080"])
}

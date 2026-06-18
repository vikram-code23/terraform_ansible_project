output "instance_id" {
  value = aws_instance.web_server1.id
}

output "public_ip" {
  value = aws_instance.web_server1.public_ip
}

output "private_ip" {
  value = aws_instance.web_server1.private_ip
}

output "elastic_ip" {
  value = aws_eip.web_eip.public_ip
}
resource "aws_eip" "web_eip" {
  domain = "vpc"
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.web_server1.id
  allocation_id = aws_eip.web_eip.id
}

#ami id
data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

#Create EC2 instance
resource "aws_instance" "web_server1" {

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  key_name = var.key_name

  subnet_id = var.subnet_id

  #associate_public_ip_address = true

  vpc_security_group_ids = [
    var.security_group_id
  ]

  iam_instance_profile = var.instance_profile_name
  user_data            = file("${path.root}/scripts/install_apache.sh")

  tags = {
    Name = "terraform-web-server"
  }
}





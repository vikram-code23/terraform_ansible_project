variable "vpc_cidr" {}
variable "public_subnet_cidr" {}
variable "private_subnet_cidr" {}

variable "public_az" {}
variable "private_az" {}

variable "allowed_ports" {
  type = list(number)

  default = [
    22,
    80,
    443,
    3000,
    9090,
    9100,
    9115
  ]
}
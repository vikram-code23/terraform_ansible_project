# AWS Infrastructure Deployment using Terraform

## Project Overview

This project demonstrates Infrastructure as Code (IaC) using Terraform to deploy AWS resources and host a static website on an Ubuntu EC2 instance.

## Technologies Used

- AWS
- Terraform
- Ubuntu Server
- Apache2
- Linux
- Networking

## AWS Resources Created

- VPC
- Public Subnet
- Private Subnet
- Internet Gateway
- Route Tables
- Route Table Associations
- Security Group
- EC2 Instance

## Features

- Infrastructure provisioned using Terraform
- Ubuntu EC2 instance deployment
- Apache Web Server installation
- Static website hosting
- SSH access using Key Pair
- Public internet access

## Architecture

Internet
|
Internet Gateway
|
Public Subnet
|
Ubuntu EC2
|
Apache Web Server
|
Static Portfolio Website

## Commands Used

```bash
terraform init
terraform plan
terraform apply
```

## apache setup

```cmds
sudo apt update
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2```

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr

  public_az  = var.public_az
  private_az = var.private_az
}

module "ec2" {
  source = "./modules/ec2"

  instance_type = var.instance_type
  key_name      = var.key_name

  subnet_id        = module.vpc.public_subnet_id
  security_group_id = module.vpc.security_group_id

  instance_profile_name = module.iam.instance_profile_name
}

module "iam" {
  source = "./modules/iam"
}

module "s3" {
  source = "./modules/s3"

  bucket_name = "vk-terraform-demo-bucket-2026"
}

resource "local_file" "ansible_inventory" {

  content = templatefile(
    "${path.module}/inventory.tpl",
    {
      public_ip = module.ec2.public_ip
    }
  )

  filename = "${path.module}/inventory.ini"
}


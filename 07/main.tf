module "instance" {
  source = "./modules/gcp-instance"

  amount = 2
  name = "linux-vm-1"
}

module "group-web" {
  source = "./modules/gcp-instance"

  amount = 3
  name = "linux-web"
  image = "debian-cloud/debian-10"
}
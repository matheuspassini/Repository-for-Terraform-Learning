module "instance" {
  source = "./modules/gcp-instance"

  amount = 2
  name = "linux-vm-1"
}

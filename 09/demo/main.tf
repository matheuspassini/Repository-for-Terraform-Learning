module "network" {
  source = "git@github.com:matheuspassini/tf-gcp-modules.git?ref=v1.0"
  name = "tf-network"
}

module "subnetwork" {
  source = "git@github.com:matheuspassini/module-gcp-subnetwork.git?ref=v1.0"
  subnet_name = "tf-subnetwork"
  vpc_name = module.network.self_link
  cidr_range = "10.10.0.0/16"
  region = "us-central1"
  depends_on = [module.network]

}

module "instance-script-master" {
  source = "git@github.com:matheuspassini/module-gcp-instance.git"
  name = "instance-master"
  image = "ubuntu-os-cloud/ubuntu-1804-lts"
  metadata_startup_script = "./scripts/install_master.sh"

  ssh-key = [
    {
      publickey = "ssh-rsa yourkeyabc username@PC"
      user = "username-master"
    }
  ]
}

module "instance-script-worker" {
  source = "git@github.com:matheuspassini/module-gcp-instance.git"

  name = "instance-worker"
  amount = 2
  image = "ubuntu-os-cloud/ubuntu-1804-lts"
  machine_type = "e2-medium"
  metadata_startup_script = "./scripts/install_worker.sh"
  ssh_keys = [
      {
          publickey = "ssh-rsa yourkeyabc username@PC"
          user      = "username-worker1"
      },
      {
          publickey = "ssh-rsa yourkeyabc username@PC"
          user      = "username-worker2"
      }
  ]
}


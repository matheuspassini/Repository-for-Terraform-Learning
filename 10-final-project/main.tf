module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "3.3.0"

  project_id   = "matheuspassini"
  network_name = "finalprojectcourseterraform"

  subnets = [
    {
      subnet_name   = "subnet-us"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = "us-central1"
    },
    {
      subnet_name   = "subnet-asia"
      subnet_ip     = "10.10.20.0/24"
      subnet_region = "asia-east1"
    }
  ]
}

resource "google_compute_firewall" "firewall-dev" {
  name = "firewall-dev"
  network = module.vpc.network_self_link

  allow {
    protocol = "tcp"
    ports = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "firewall-load-balancer" {
  name    = "firewall-load-balancer"
  network = module.vpc.network_self_link

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
}

data "google_compute_subnetwork" "subnet-us" {
  name = "subnet-us"
  region = "us-central1"
  depends_on = [module.vpc]
}

data "google_compute_subnetwork" "subnet-asia" {
  name = "subnet-asia"
  region = "asia-east1"
  depends_on = [module.vpc]
}

module "instance-template-us" {
  source = "./module-gcp-instance"
  name = "us"
  metadata_startup_script = "./scripts/us.sh"
  network = module.vpc.network_self_link
  subnetwork = data.google_compute_subnetwork.subnet-us.self_link
}

module "instance-template-asia" {
  source = "./module-gcp-instance"
  name = "asia"
  metadata_startup_script = "./scripts/asia.sh"
  network = module.vpc.network_self_link
  subnetwork = data.google_compute_subnetwork.subnet-asia.self_link
}

module "instance-group-us" {
  source = "./module-gcp-manager"
  name = "instance-group-us"
  base_instance_name = "us-web"
  region = "us-central1"
  instance_template = module.instance-template-us.self_link
  distribution_policy_zones = ["us-central1-a", "us-central1-b"]
  depends_on = [module.vpc]
}

module "instance-group-asia" {
  source = "./module-gcp-manager"
  name = "instance-group-asia"
  base_instance_name = "asia-web"
  region = "asia-east1"
  instance_template = module.instance-template-asia.self_link
  distribution_policy_zones = ["asia-east1-a"]
  depends_on = [module.vpc]
}

module "module-load-balancer" {
  source = "./module-gcp-load-balancer"
  backends = [
    module.instance-group-us.instance_group,
    module.instance-group-asia.instance_group
  ]
}

output "load-balancer-ip" {
  value = module.module-load-balancer.ip
}

resource "google_compute_instance" "bastion1" {
  count = terraform.workspace == "prod" ? 3 : 2
  name = format("%s-%s", "bastion", count.index)
  machine_type = "e2-micro"
  zone = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    subnetwork = data.google_compute_subnetwork.subnet-us.self_link

    access_config {
    }
  }
}

resource "google_compute_instance" "bastion2" {
  count = terraform.workspace == "prod" ? 3 : 2
  name = format("%s-%s", "bastion", count.index)
  machine_type = "e2-micro"
  zone = "asia-east1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    subnetwork = data.google_compute_subnetwork.subnet-asia.name

    access_config {
    }
  }
}
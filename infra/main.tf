provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}



resource "google_compute_instance" "docker" {
  name         = "docker"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"
  tags         = ["docker-app"]

  boot_disk {
    initialize_params {
      image =  "ubuntu-1604-xenial-v20180126"
      size = 100
    }
  }

  network_interface {
    network = "default"

    access_config = {
      nat_ip = "${google_compute_address.docker_ip.address}"
    }
  }
}


resource "google_compute_address" "docker_ip" {
  name = "docker-ip"
}

resource "google_compute_firewall" "firewall_http" {
  name    = "allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["docker-app"]
}

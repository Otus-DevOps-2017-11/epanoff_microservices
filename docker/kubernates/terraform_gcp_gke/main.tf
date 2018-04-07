provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}



resource "google_container_cluster" "primary" {
  name               = "epanoff-gke"
  zone               = "${var.zone}"
  initial_node_count = 3
  enable_legacy_abac = false

}

resource "google_compute_firewall" "firewall_http" {
  name    = "allow-gke-32000"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["30000-32767"]
  }

  source_ranges = ["0.0.0.0/0"]
}

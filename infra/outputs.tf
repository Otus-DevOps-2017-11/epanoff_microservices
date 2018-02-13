output "docker_external_ip" {
  value = "${google_compute_address.docker_ip.address}"
}
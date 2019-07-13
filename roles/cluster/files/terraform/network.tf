resource "google_compute_network" "grafana" {
  name = "grafana-production-vpc"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "grafana" {
  name   = "grafana-production-subnet"
  ip_cidr_range = "10.0.0.0/18"
  region = "europe-west1"
  network = "${google_compute_network.grafana.self_link}"
  private_ip_google_access = "true"
}

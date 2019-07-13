resource "google_container_cluster" "grafana-cluster" {
  name               = "grafana-cluster-production"
  location               = "europe-west1-b"
  network = "${google_compute_network.grafana.self_link}"
  subnetwork = "${google_compute_subnetwork.grafana.self_link}"

  resource_labels = {
    product = "grafana"
    env = "production"
    owner = "michael_ekpang"
    maintainer = "michael_ekpang"
    state = "in_use"
  }
  node_pool = [{
    name = "default-pool"
    node_count = "3"

    autoscaling = {
      min_node_count = "3"
      max_node_count = "5"
    }

    node_config = {
    machine_type = "n1-standard-1"
    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append"
    ]
  }
    management = {
      auto_upgrade = "true"
    }
  }]
}

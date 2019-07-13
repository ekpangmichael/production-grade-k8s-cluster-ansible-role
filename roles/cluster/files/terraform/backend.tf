terraform {
  backend "gcs" {
    bucket  = "grafana-cluster-tf-state"
    prefix  = "terraform/state"
  }
}

resource "google_container_cluster" "default" {
  name       = "${local.name}"
  network    = "${var.network}"
  subnetwork = "${google_compute_subnetwork.default.self_link}"

  // Even if default gets deleted, initial_node_count has to be > 0
  remove_default_node_pool = "true"
  initial_node_count       = "1"

  node_config {
    preemptible = "${var.preemptible}"
  }

  maintenance_policy {
    daily_maintenance_window {
      start_time = "22:00"
    }
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "${google_compute_subnetwork.default.name}-cluster"
    services_secondary_range_name = "${google_compute_subnetwork.default.name}-services"
  }
}

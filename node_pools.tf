resource "google_container_node_pool" "default" {
  count = "${var.node_pools_count}"

  name       = "${local.name}-${count.index}"
  cluster    = "${google_container_cluster.default.name}"
  node_count = "${var.node_count}"

  node_config {
    machine_type = "${var.machine_type}"

    disk_size_gb = "${var.disk_size_gb}"
    disk_type    = "pd-ssd"
    preemptible  = "${var.preemptible}"

    service_account = "${google_service_account.default.email}"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]

    tags = [
      "k8s-node",
    ]
  }

  lifecycle {
    ignore_changes = [
      "node_count",
    ]
  }

  management {
    auto_repair  = "true"
    auto_upgrade = "false"
  }
}

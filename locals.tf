locals {
  roles = [
    "roles/logging.logWriter",
    "roles/logging.viewer",
    "roles/monitoring.metricWriter",
    "roles/storage.objectViewer",
  ]

  name = "${var.id == "" ? var.environment : format("%s-%s", var.environment, var.id)}"
}

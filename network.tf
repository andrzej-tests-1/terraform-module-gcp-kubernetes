resource "google_compute_subnetwork" "default" {
  name                     = "${var.environment}-k8s"
  network                  = "${var.network}"
  ip_cidr_range            = "${var.ip_cidr_range}"
  private_ip_google_access = "true"

  secondary_ip_range {
    ip_cidr_range = "${lookup(var.secondary_ip_ranges, "cluster")}"
    range_name    = "${var.environment}-k8s-cluster"
  }

  secondary_ip_range {
    ip_cidr_range = "${lookup(var.secondary_ip_ranges, "services")}"
    range_name    = "${var.environment}-k8s-services"
  }
}

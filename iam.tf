resource "google_service_account" "default" {
  account_id   = "k8s-${local.name}"
  display_name = "k8s-${local.name}"
}

resource "google_project_iam_member" "default" {
  count = "${length(local.roles)}"

  role   = "${element(local.roles, count.index)}"
  member = "serviceAccount:${google_service_account.default.email}"
}

# terraform-module-gcp-kubernetes

Create and manage GCP Kubernetes clusters.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Name of environment within instance will be created | string | n/a | yes |
| ip\_cidr\_range | The IP CIDR range represented by this alias IP range | string | n/a | yes |
| machine\_type | Machine type | string | n/a | yes |
| network | The name of the network to attach interfaces to | string | n/a | yes |
| node\_count | Number of node per node pool | string | n/a | yes |
| secondary\_ip\_ranges | Map of IP additional networks [name : ip_cidr_range] | map | n/a | yes |
| disk\_size\_gb | Size disk | string | `"10"` | no |
| id | Additional identifier for cluster (ID is added in the end of cluster name) | string | `""` | no |
| node\_pools\_count | Number of node pools for k8s cluster | string | `"1"` | no |
| preemptible | Specifies if the instance is preemptible | string | `"false"` | no |

## Example
```hcl-terraform
module "kubernetes" {
  source = "git::ssh://git@github.com/andrzej-tests-1/terraform-module-gcp-kubernetes?ref=1.0.0"

  environment  = "${var.environment}"
  id           = "1"
  machine_type = "g1-small"
  node_count   = "2"

  network       = "${module.network.network}"
  ip_cidr_range = "10.1.0.0/16"
  secondary_ip_ranges = {
    "cluster"  = "10.2.0.0/16"
    "services" = "10.3.0.0/16"
  }
}
```

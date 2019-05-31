variable "environment" {
  description = "Name of environment within instance will be created"
  type        = "string"
}

variable "id" {
  description = "Additional identifier for cluster (ID is added in the end of cluster name)"
  type        = "string"
  default     = ""
}

variable "machine_type" {
  description = "Machine type"
  type        = "string"
}

variable "node_count" {
  description = "Number of node per node pool"
  type        = "string"
}

variable "network" {
  description = "The name of the network to attach interfaces to"
  type        = "string"
}

variable "ip_cidr_range" {
  description = "The IP CIDR range represented by this alias IP range"
  type        = "string"
}

variable "secondary_ip_ranges" {
  description = "Map of IP additional networks [name : ip_cidr_range]"
  type        = "map"
}

variable "preemptible" {
  description = "Specifies if the instance is preemptible"
  type        = "string"
  default     = "false"
}

variable "disk_size_gb" {
  description = "Size disk"
  type        = "string"
  default     = "10"
}

variable "node_pools_count" {
  description = "Number of node pools for k8s cluster"
  type        = "string"
  default     = "1"
}

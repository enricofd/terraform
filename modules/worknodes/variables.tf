locals {
  node_name = "node-${random_string.suffix_2.result}"
}

resource "random_string" "suffix_2" {
  length  = 4
  special = false
}

variable "eks_subnet_ids" {}
variable "cluster_name" {}
variable "worknodes" {}
variable "worknode_desired_size" {}
variable "worknode_max_size" {}
variable "worknode_min_size" {}

locals {
  cluster_name = "cluster-${random_string.suffix_1.result}"
}

resource "random_string" "suffix_1" {
  length  = 8
  special = false
}

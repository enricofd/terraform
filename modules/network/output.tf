output "vpc_id" {
  value = module.vpc.vpc_id
}

output "eks_subnet_ids" {
  value = module.vpc.private_subnets
}

output "cluster_name" {
  value = local.cluster_name
}
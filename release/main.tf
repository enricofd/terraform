terraform {
  required_version = "1.1.9"
}

provider "aws" {
  region = "us-east-1"
  # shared_credentials_file = "../credentials"
  profile = "default"
}

# provider "tls" {
#   version = "~> 2.1"
# }

module "network" {
  source = "../modules/network"
  #   tags = {
  #     Env = basename(path.cwd)
  #   }
}

module "cluster" {
  source         = "../modules/cluster"
  vpc_id         = module.network.vpc_id
  eks_subnet_ids = module.network.eks_subnet_ids
  cluster_name   = module.network.cluster_name

  #   tags = {
  #     Env = basename(path.cwd)
  #   }
}

module "worknodes" {
  source         = "../modules/worknodes"
  eks_subnet_ids = module.network.eks_subnet_ids
  cluster_name   = module.network.cluster_name

  worknodes             = 3
  worknode_desired_size = 4
  worknode_max_size     = 6
  worknode_min_size     = 2

  #   #   tags = {
  #   #     Env = basename(path.cwd)
  #   #   }
}

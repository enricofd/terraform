resource "aws_eks_cluster" "insper_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.insper-eks-cluster-role.arn
  version  = "1.22"

  #   tags = var.tags

  vpc_config {
    subnet_ids = var.eks_subnet_ids
  }

  depends_on = [
    aws_iam_role_policy_attachment.insper-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.insper-AmazonEKSServicePolicy,
  ]
}

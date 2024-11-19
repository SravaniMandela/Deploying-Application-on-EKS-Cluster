#nodegrp.tf

resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_role_arn   = aws_iam_role.eks_node_role.arn
  subnet_ids      = aws_subnet.eks_subnet[*].id
  node_group_name = "eks-node-group"

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
  
  tags = {
    "Name"        = "eks-node-group"
  }

}

// Define the AWS provider
provider "aws" {
    region = "us-east-1" 
}

// Data sources to retrieve information about the EKS cluster
data "aws_eks_cluster" "cluster" {
    name = aws_eks_cluster.my-cluster.name
}

data "aws_eks_cluster_auth" "cluster" {
    name = aws_eks_cluster.my-cluster.name
}

// Resource to create an EKS cluster
resource "aws_eks_cluster" "my-cluster" {
    name = "my-cluster"
    role_arn = aws_iam_role.eks_cluster_role.arn

    vpc_config {
        subnet_ids = aws_subnet.eks_subnets[*].id // Use subnets created in vpc.tf
    }
}

// Resource to create an EKS node group 
resource "aws_eks_node_group" "node_group" {
    cluster_name = aws_eks_cluster.my-cluster.name
    node_group_name = "my-node-group"
    node_role_arn = aws_iam_role.eks_node_role.arn
    subnet_ids = aws_subnet.eks_subnets[*].id

    scaling_config {
        desired_size = 2
        max_size = 3
        min_size = 1
    }
}
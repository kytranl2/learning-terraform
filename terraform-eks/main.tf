// Define the AWS provider
provider "aws" {
    region = var.region
}

// Data sources to retrieve information about the EKS cluster
data "aws_eks_cluster" "cluster" {
    name = aws_eks_cluster.my_cluster.name
}

data "aws_eks_cluster_auth" "cluster" {
    name = aws_eks_cluster.my_cluster.name
}

// Resource to create an EKS cluster
resource "aws_eks_cluster" "my_cluster" {
    name     = var.cluster_name
    role_arn = aws_iam_role.eks_cluster_role.arn

    vpc_config {
        subnet_ids = aws_subnet.eks_subnets[*].id
        security_group_ids = [aws_security_group.eks_security_group.id]
    }
}

// Resource to create an EKS node group
resource "aws_eks_node_group" "my_node_group" {
    cluster_name    = aws_eks_cluster.my_cluster.name
    node_group_name = "my-node-group"
    node_role_arn   = aws_iam_role.eks_node_role.arn
    subnet_ids      = aws_subnet.eks_subnets[*].id

    scaling_config {
        desired_size = var.desired_capacity
        max_size     = var.max_capacity
        min_size     = var.min_capacity
    }

    instance_types = ["t3.medium"]

    remote_access {
        ec2_ssh_key = "my-key"
        source_security_group_ids = [aws_security_group.eks_security_group.id]
    }

    ami_type = "AL2_x86_64"
}

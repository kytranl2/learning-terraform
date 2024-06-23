// Output the EKS cluster endpoint
output "cluster_endpoint" {
    value = aws_eks_cluster.my-cluster.endpoint
}

// Output the EKS cluster name
output "cluster_name" {
    value = aws_eks_cluster.my-cluster.name
}

// Output the EKS cluster security group ID
output "cluster_security_group_id" {
    value = aws_eks_cluster.my-cluster.vpc_config[0].cluster_security_group_id
}


output "cluster_endpoint" {
    value = aws_eks_cluster.my_cluster.endpoint
}

output "cluster_name" {
    value = aws_eks_cluster.my_cluster.name
}

output "cluster_security_group_id" {
    value = aws_eks_cluster.my_cluster.vpc_config[0].cluster_security_group_id
}

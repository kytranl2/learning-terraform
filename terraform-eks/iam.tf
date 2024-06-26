// IAM role for the EKS cluster
resource "aws_iam_role" "eks_cluster_role" {
    name = "eks-cluster-role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
                Action = "sts:AssumeRole",
                Effect = "Allow",
                Principal = {
                    Service = "eks.amazonaws.com"
                }
            },
        ]
    })
}

// Attach EKS Cluster Policy to the IAM role
resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role       = aws_iam_role.eks_cluster_role.name
}

// Attach EKS Service Policy to the IAM role
resource "aws_iam_role_policy_attachment" "eks_service_policy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
    role       = aws_iam_role.eks_cluster_role.name
}

// IAM role for the EKS node group
resource "aws_iam_role" "eks_node_role" {
    name = "eks-node-role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
                Action = "sts:AssumeRole",
                Effect = "Allow",
                Principal = {
                    Service = "ec2.amazonaws.com"
                }
            },
        ]
    })
}

// Attach EKS Worker Node Policy to the IAM role
resource "aws_iam_role_policy_attachment" "eks_worker_node_policy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    role       = aws_iam_role.eks_node_role.name
}

// Attach EKS CNI Policy to the IAM role
resource "aws_iam_role_policy_attachment" "eks_cni_policy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    role       = aws_iam_role.eks_node_role.name
}

// Attach EC2 Container Registry Read Only Policy to the IAM role
resource "aws_iam_role_policy_attachment" "ec2_container_registry_read_only" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    role       = aws_iam_role.eks_node_role.name
}

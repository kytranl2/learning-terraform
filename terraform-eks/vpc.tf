// Resource to create a VPC
resource "aws_vpc" "eks_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = "eks-vpc"
    }
}

// Resource to create an Internet Gateway
resource "aws_internet_gateway" "eks_igw" {
    vpc_id = aws_vpc.eks_vpc.id
    tags = {
        Name = "eks-igw"
    }
}

// Resource to create public route table
resource "aws_route_table" "eks_public_rt" {
    vpc_id = aws_vpc.eks_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.eks_igw.id
    }
    tags = {
        Name = "eks-public-rt"
    }
}

// Resource to create subnets in the VPC
resource "aws_subnet" "eks_subnets" {
    count = 2
    vpc_id = aws_vpc.eks_vpc.id
    cidr_block = "10.0.${count.index}.0/24"
    availability_zone = element(data.aws_availability_zones.available.names, count.index)
    map_public_ip_on_launch = true
    tags = {
        Name = "eks-subnet-${count.index}"
    }
}

// Associate subnets with the public route table
resource "aws_route_table_association" "eks_public_rt_assoc" {
    count = 2
    subnet_id = aws_subnet.eks_subnets[count.index].id
    route_table_id = aws_route_table.eks_public_rt.id
}

// Data source to retrieve available AWS availability zones
data "aws_availability_zones" "available" {}

// Security group for EKS nodes
resource "aws_security_group" "eks_security_group" {
    vpc_id = aws_vpc.eks_vpc.id
    description = "Allow all inbound traffic for EKS"

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "eks-security-group"
    }
}
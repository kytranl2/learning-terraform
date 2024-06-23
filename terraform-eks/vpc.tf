// Resource to create a VPC
resource "aws_vpc" "eks_vpc" {
    cidr_block = "10.0.0.0/16" 
}

// Resource to create subnets in the VPC
resource "aws_subnet" "eks_subnets" {
    count = 2
    vpc_id = aws_vpc.eks_vpc.id
    cidr_block = "10.0.${count.index}.0/24"
    availability_zone = element(data.aws_availability_zones.available.names, count.index)
    map_public_ip_on_launch = true
}

// Data source to retrieve availble AWS availability zones 
data "aws_availability_zones" "available" {}
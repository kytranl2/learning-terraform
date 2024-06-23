// Define region variable with a default value
variable "region" {
    default = "us-east-1" 
}

// Define cluster name variable with a default value
variable "cluster_name" {
    default = "my-cluster"
}

// Define desired capacity variable for the node group
variable "desired_capacity" {
    default = 2
}

// Define maximum capacity variable for the node group
variable "max_capacity" {
    default = 3
}

// Define minimum capacity variable for the node group
variable "min_capacity" {
    default = 1
}
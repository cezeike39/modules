variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "my-vpc"

}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"

}
variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "availability_zones" {
  description = "List of availability zones for the subnets"
  type        = list(string)
}
variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}
variable "igw" {
  description = "The name of the Internet Gateway"
  type        = string
  default     = "my-igw"

}
variable "private_route_cidr" {
  description = "The CIDR block for private route"
  type        = string
  default     = "0.0.0.0/0"

}
variable "public_route_cidr" {
  description = "The CIDR block for public route"
  type        = string
  default     = "0.0.0.0/0"
}
variable "eip" {
  description = "The Elastic IP for NAT Gateway"
  type        = string
  default     = "my-elastic-ip"
}
variable "nat_gateway" {
  description = "The name of the NAT Gateway"
  type        = string
  default     = "my-nat-gateway"
}
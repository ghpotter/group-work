resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support   = true
    enable_dns_hostnames = true
    tags       = {
        Name = "Terraform VPC"
    }
}

resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = aws_vpc.vpc.id
}

resource "aws_subnet" "public_subnet_1" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = "10.0.0.0/24"
}

resource "aws_subnet" "public_subnet_2" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = "10.0.1.0/24"
}

resource "aws_subnet" "private_subnet_1" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = "10.0.2.0/24"
}

resource "aws_subnet" "private_subnet_2" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = "10.0.3.0/24"
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet_gateway.id
    }
}

resource "aws_route_table_association" "route_table_association1" {
    subnet_id      = aws_subnet.public_subnet_1.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "route_table_association2" {
    subnet_id      = aws_subnet.public_subnet_2.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "route_table_association3" {
    subnet_id      = aws_subnet.private_subnet_1.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "route_table_association4" {
    subnet_id      = aws_subnet.private_subnet_2.id
    route_table_id = aws_route_table.public.id
}
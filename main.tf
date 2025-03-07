# Create a VPC to launch our instances into
resource "aws_vpc" "dev_vpc" {
  cidr_block = "10.0.0.0/16"  
  enable_dns_hostnames = true 
  enable_dns_support = true
  
  tags =  {
    name = "deham21"
  }       
}

# Create a Public Subnet
resource "aws_subnet" "public-1" {
  vpc_id = aws_vpc.dev_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "deham21"
    dept = "AWS"
  }

  depends_on = [ aws_vpc.dev_vpc ]
}

# Create an Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name = "deham21"
  }

  depends_on = [ aws_vpc.dev_vpc ]
}

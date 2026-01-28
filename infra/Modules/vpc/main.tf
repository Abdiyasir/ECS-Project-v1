resource "aws_vpc" "threat-composer" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "public-1" {
  vpc_id     = aws_vpc.threat-composer.id
  cidr_block = var.public-1_subnet
  availability_zone = var.az-1
  tags = {
    Name = "public-1"
  }
}

resource "aws_subnet" "public-2" {
  vpc_id     = aws_vpc.threat-composer.id
  cidr_block = var.public-2_subnet
  availability_zone = var.az-2
  tags = {
    Name = "public-2"
  }
}

resource "aws_subnet" "private-1" {
  vpc_id     = aws_vpc.threat-composer.id
  cidr_block = var.private-1_subnet
  availability_zone = var.az-1
  tags = {
    Name = "private-1"
  }
}

resource "aws_subnet" "private-2" {
  vpc_id     = aws_vpc.threat-composer.id
  cidr_block = var.private-2_subnet
  availability_zone = var.az-2
  tags = {
    Name = "private-2"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.threat-composer.id

  tags = {
    Name = "igw"
  }
}

resource "aws_route_table" "igw" {
  vpc_id = aws_vpc.threat-composer.id

  route {
    cidr_block = var.igw_cidr
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "IGW route table"
  }
}

resource "aws_eip" "ngw-1" {
  domain = "vpc"
  
  tags = {
    Name = "Elastic IP 1"
  }
}

resource "aws_eip" "ngw-2" {
  domain = "vpc"
  
  tags = {
    Name = "Elastic IP 2"
  }
}

resource "aws_nat_gateway" "ngw-1" {
  allocation_id = aws_eip.ngw-1.id
  subnet_id     = aws_subnet.public-1.id

  tags = {
    Name = "NGW for public subnet 1"
  }
  
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route_table" "public-1-ngw" {
  vpc_id = aws_vpc.threat-composer.id

  route {
    cidr_block     = var.ngw-1_cidr
    nat_gateway_id = aws_nat_gateway.ngw-1.id 
  }

  tags = {
    Name = "public subnet 1 nat-route-table"
  }
}

resource "aws_route_table_association" "public-1-ngw" {
  subnet_id      = aws_subnet.public-1.id
  route_table_id = aws_route_table.public-1-ngw.id
}

resource "aws_nat_gateway" "ngw-2" {
  allocation_id = aws_eip.ngw-2.id
  subnet_id     = aws_subnet.public-2.id

  tags = {
    Name = "NGW for public subnet 2"
  }
  
  depends_on = [aws_internet_gateway.igw]
}
resource "aws_route_table" "public-2-ngw" {
  vpc_id = aws_vpc.threat-composer.id

  route {
    cidr_block     = var.ngw-2_cidr
    nat_gateway_id = aws_nat_gateway.ngw-2.id 
  }

  tags = {
    Name = "public subnet 2 nat-route-table"
  }
}

resource "aws_route_table_association" "public-2-ngw" {
  subnet_id      = aws_subnet.public-2.id
  route_table_id = aws_route_table.public-2-ngw.id
}
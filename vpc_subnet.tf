// public subnet
resource "aws_subnet" "public-a" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.vpc.id
  availability_zone = "ap-northeast-1a"
}
// private subnet
resource "aws_subnet" "private-a" {
  cidr_block = "10.0.2.0/24"
  vpc_id = aws_vpc.vpc.id
  availability_zone = "ap-northeast-1a"
}
// RDS subnet az-1a
resource "aws_subnet" "dbsub-a" {
  cidr_block = "10.0.3.0/24"
  vpc_id = aws_vpc.vpc.id
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "db-subnet-1a"
  }
}
// RDS subnet az-1c
resource "aws_subnet" "dbsub-c" {
  cidr_block = "10.0.4.0/24"
  vpc_id = aws_vpc.vpc.id
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "db-subnet-1c"
  }
}

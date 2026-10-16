resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.redhat-vpc.id
  tags = {
    Name = "igw"
  }
}
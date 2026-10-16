resource "aws_instance" "DevOps-ec2" {
  ami           = "ami-0b6d9d3d33ba97d99" # Ubuntu 26.4 AMI
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public-subnet.id
  key_name      = "Testserver" # Replace with your key pair name
  vpc_security_group_ids = [aws_security_group.public-sg.id]
  user_data = file("${path.module}/userdata.sh")
  associate_public_ip_address = true
  iam_instance_profile = aws_iam_instance_profile.app_server_profile.name

  tags = {
    Name = "DevOps-ec2"
  }
}
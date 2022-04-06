resource "aws_security_group" "web_server_sg" {
  name        = "web_server_sg"
  description = "Allow access to server"
  vpc_id      = data.aws_vpc.main_vpc.id


  #Inbound Connections
  ingress {
    description = "Allow SSH into the EC2"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["38.88.10.210/32"]
  }

  ingress {
    description = "Allow HTTP into the EC2"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["38.88.10.210/32"] # 0.0.0.0/0
  }


  #Outbound Connections

  egress {
    description = "Allow access to all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # TCP + UDP
    cidr_blocks = ["0.0.0.0/0"]
  }
}
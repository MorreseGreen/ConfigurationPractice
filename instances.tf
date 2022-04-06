resource "aws_instance" "web_servers" {
  count                  = 4
  ami                    = data.aws_ami.aws_basic_linux.id
  instance_type          = var.ec2_type
  subnet_id              = data.aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]
  key_name               = var.my_keypair
#   iam_instance_profile   = aws_iam_instance_profile.dashboard_server_profile.id
#   user_data              = file("user-data.sh")


  tags = {
    Name = "web_server_${count.index + 1}"
  }

}
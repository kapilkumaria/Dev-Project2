resource "aws_security_group" "websg" {
  name        = "allow_web_traffic"
  description = "Allow web server inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allowing HTTP traffic on port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.myip
  }

  ingress {
    description = "Allowing SSH connection from my computer"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.myip
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.websg_tag
  }
}



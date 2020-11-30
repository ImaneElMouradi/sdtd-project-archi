resource "aws_default_security_group" "default" {
   vpc_id      = aws_default_vpc.default.id
 ingress {
     from_port   = 22
     to_port     = 22
     protocol    = "tcp"
     cidr_blocks     = ["46.193.4.103/32"]
   }
 egress {
     from_port       = 0
     to_port         = 0
     protocol        = "-1"
     cidr_blocks     = ["0.0.0.0/0"]
   }
 }

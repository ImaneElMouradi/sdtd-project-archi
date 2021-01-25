resource "aws_default_security_group" "default" {
   vpc_id      = aws_default_vpc.default.id
   revoke_rules_on_delete = true
 ingress {
     from_port   = 22
     to_port     = 22
     protocol    = "tcp"
     cidr_blocks     = ["0.0.0.0/0"]
   }

 egress {
     from_port       = 0
     to_port         = 0
     protocol        = "-1"
     cidr_blocks     = ["0.0.0.0/0"]
   }
 }

resource "aws_security_group" "allow_kafka" {
   vpc_id      = aws_default_vpc.default.id
   revoke_rules_on_delete = true

   ingress {
     from_port   = 9092
     to_port     = 9092
     protocol    = "tcp"
     cidr_blocks     = ["0.0.0.0/0"]
   }

 egress {
     from_port       = 0
     to_port         = 0
     protocol        = "-1"
     cidr_blocks     = ["0.0.0.0/0"]
   }
 }

resource "aws_security_group" "allow_cassandra" {
   vpc_id      = aws_default_vpc.default.id
   revoke_rules_on_delete = true

   ingress {
     from_port   = 9042
     to_port     = 9042
     protocol    = "tcp"
     cidr_blocks     = ["0.0.0.0/0"]
   }

 egress {
     from_port       = 0
     to_port         = 0
     protocol        = "-1"
     cidr_blocks     = ["0.0.0.0/0"]
   }
 }

 resource "aws_security_group" "allow_zookeeper" {
   vpc_id      = aws_default_vpc.default.id
   revoke_rules_on_delete = true

   ingress {
     from_port   = 2181
     to_port     = 2181
     protocol    = "tcp"
     cidr_blocks     = ["0.0.0.0/0"]
   }

 egress {
     from_port       = 0
     to_port         = 0
     protocol        = "-1"
     cidr_blocks     = ["0.0.0.0/0"]
   }
 }

 resource "aws_security_group" "allow_spark" {
   vpc_id      = aws_default_vpc.default.id
   revoke_rules_on_delete = true

   ingress {
     from_port   = 0
     to_port     = 0
     protocol    = "-1"
     cidr_blocks     = ["0.0.0.0/0"]
   }

 egress {
     from_port       = 0
     to_port         = 0
     protocol        = "-1"
     cidr_blocks     = ["0.0.0.0/0"]
   }
 }
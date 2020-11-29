resource "aws_instance" "kafka" {
	ami = lookup(var.AMIS, var.AWS_REGION)
	instance_type = "t2.micro"
}

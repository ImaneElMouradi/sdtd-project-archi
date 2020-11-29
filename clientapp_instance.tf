resource "aws_instance" "client-app" {
	ami = lookup(var.AMIS, var.AWS_REGION)
	instance_type = "t2.micro"
}


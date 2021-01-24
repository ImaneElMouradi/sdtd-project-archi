resource "aws_instance" "spark1" {
	ami = lookup(var.AMIS, var.AWS_REGION)
	instance_type = "t2.large"
    key_name = "admin"
	private_ip = "172.31.48.37"
	subnet_id = "subnet-0c6a85d5766c1047c"
	monitoring = "true"
    vpc_security_group_ids = [aws_default_security_group.default.id, aws_security_group.allow_spark.id]


	tags = {
            Name = "spark1"
    }

	connection {
			type = "ssh"
			user        = "ubuntu"
			private_key = file(var.keyPath)
			host = self.public_dns
	}

	provisioner "local-exec" {
			command = "echo ${aws_instance.spark1.private_ip}"
	}

	provisioner "file" {
			source = "script/script_spark.sh"
			destination = "/tmp/script_spark.sh"
	}

	provisioner "remote-exec" {
			inline = [
					"chmod +x /tmp/script_spark.sh",
					"/tmp/script_spark.sh",
			]
	}
}

resource "aws_instance" "spark2" {
	ami = lookup(var.AMIS, var.AWS_REGION)
	instance_type = "t2.large"
    key_name = "admin"
	private_ip = "172.31.48.38"
	subnet_id = "subnet-0c6a85d5766c1047c"
	monitoring = "true"
    vpc_security_group_ids = [aws_default_security_group.default.id, aws_security_group.allow_spark.id]


	tags = {
            Name = "spark2"
    }

	connection {
			type = "ssh"
			user        = "ubuntu"
			private_key = file(var.keyPath)
			host = self.public_dns
	}

	provisioner "local-exec" {
			command = "echo ${aws_instance.spark2.private_ip}"
	}

	provisioner "file" {
			source = "script/script_spark.sh"
			destination = "/tmp/script_spark.sh"
	}

	provisioner "remote-exec" {
			inline = [
					"chmod +x /tmp/script_spark.sh",
					"/tmp/script_spark.sh",
			]
	}
}



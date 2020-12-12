resource "aws_instance" "spark" {
	ami = lookup(var.AMIS, var.AWS_REGION)
	instance_type = "t2.large"
    key_name = "admin"
	private_ip = "172.31.48.37"
	subnet_id = "subnet-03cfb1532a4b2393b"

	tags = {
            Name = "spark"
    }

	connection {
			type = "ssh"
			user        = "ubuntu"
			private_key = file(var.keyPath)
			host = self.public_dns
	}

	provisioner "local-exec" {
			command = "echo ${aws_instance.spark.private_ip}"
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


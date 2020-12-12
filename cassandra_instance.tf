resource "aws_instance" "cassandra" {
	ami = lookup(var.AMIS, var.AWS_REGION)
	instance_type = "t2.large"
	key_name = "admin"
	private_ip = "172.31.48.39"
	subnet_id = "subnet-03cfb1532a4b2393b"
    vpc_security_group_ids = [aws_default_security_group.default.id, aws_security_group.allow_cassandra.id]

	tags = {
            Name = "cassandra"
    }

	connection {
			type = "ssh"
			user        = "ubuntu"
			private_key = file(var.keyPath)
			host = self.public_dns
	}

	provisioner "local-exec" {
			command = "echo ${aws_instance.cassandra.private_ip}"
	}

	provisioner "file" {
			source = "script/script_cassandra.sh"
			destination = "/tmp/script_cassandra.sh"
	}

	provisioner "remote-exec" {
			inline = [
					"chmod +x /tmp/script_cassandra.sh",
					"/tmp/script_cassandra.sh",
			]
	}

}


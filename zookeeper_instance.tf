resource "aws_instance" "zookeeper" {
	ami = lookup(var.AMIS, var.AWS_REGION)
	instance_type = "t2.large"
	key_name = "admin"
	private_ip = "172.31.48.50"
	subnet_id = "subnet-5403c365"
    vpc_security_group_ids = [aws_default_security_group.default.id, aws_security_group.allow_zookeeper.id]

	tags = {
            Name = "zookeeper"
    }

	connection {
			type = "ssh"
			user        = "ubuntu"
			private_key = file(var.keyPath)
			host = self.public_dns
	}

	provisioner "local-exec" {
			command = "echo ${aws_instance.zookeeper.private_ip}"
	}

	provisioner "file" {
			source = "script/script_zookeeper.sh"
			destination = "/tmp/script_zookeeper.sh"
	}

	provisioner "remote-exec" {
			inline = [
					"chmod +x /tmp/script_zookeeper.sh",
					"/tmp/script_zookeeper.sh",
			]
	}

}


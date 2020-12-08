resource "aws_instance" "client" {
	ami = lookup(var.AMIS, var.AWS_REGION)
	instance_type = "t2.micro"
	key_name = "admin"
	private_ip = "172.31.48.20"
	subnet_id = "subnet-03cfb1532a4b2393b"

	tags = {
			Name = "client"
	}

	connection {
			type = "ssh"
			user        = "ubuntu"
			private_key = file(var.keyPath)
			host = self.public_dns
	}

	provisioner "local-exec" {
			command = "echo ${aws_instance.client.private_ip}"
	}

	provisioner "file" {
			source = "country_crimes.py"
			destination = "/home/ubuntu/country_crimes.py"
	}

	provisioner "remote-exec" {
			inline = [
					"sudo apt update",
					"sudo apt install python3-pip -y",
					"pip3 install numpy kafka-python",
					"python3 /home/ubuntu/country_crimes.py France",
			]
	}
}


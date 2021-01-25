resource "aws_instance" "spark_master_1" {
	ami = lookup(var.AMIS, var.AWS_REGION)
	instance_type = "t2.large"
    key_name = "admin"
	private_ip = "172.31.48.37"
	subnet_id = "subnet-5403c365"
	monitoring = "true"
    vpc_security_group_ids = [aws_default_security_group.default.id, aws_security_group.allow_spark.id]


	tags = {
            Name = "spark_master_1"
    }

	connection {
			type = "ssh"
			user        = "ubuntu"
			private_key = file(var.keyPath)
			host = self.public_dns
	}

	provisioner "local-exec" {
			command = "echo ${aws_instance.spark_master_1.private_ip}"
	}

	provisioner "file" {
			source = "script/script_spark_master.sh"
			destination = "/tmp/script_spark_master.sh"
	}

	provisioner "remote-exec" {
			inline = [
					"chmod +x /tmp/script_spark_master.sh",
					"/tmp/script_spark_master.sh",
			]
	}
}

resource "aws_instance" "spark_master_2" {
	ami = lookup(var.AMIS, var.AWS_REGION)
	instance_type = "t2.large"
    key_name = "admin"
	private_ip = "172.31.48.38"
	subnet_id = "subnet-5403c365"
	monitoring = "true"
    vpc_security_group_ids = [aws_default_security_group.default.id, aws_security_group.allow_spark.id]


	tags = {
            Name = "spark_master_2"
    }

	connection {
			type = "ssh"
			user        = "ubuntu"
			private_key = file(var.keyPath)
			host = self.public_dns
	}

	provisioner "local-exec" {
			command = "echo ${aws_instance.spark_master_2.private_ip}"
	}

	provisioner "file" {
			source = "script/script_spark_master.sh"
			destination = "/tmp/script_spark_master.sh"
	}

	provisioner "remote-exec" {
			inline = [
					"chmod +x /tmp/script_spark_master.sh",
					"/tmp/script_spark_master.sh",
			]
	}
}


resource "aws_instance" "spark_worker_1" {
	ami = lookup(var.AMIS, var.AWS_REGION)
	instance_type = "t2.large"
    key_name = "admin"
	private_ip = "172.31.48.80"
	subnet_id = "subnet-5403c365"
	monitoring = "true"
    vpc_security_group_ids = [aws_default_security_group.default.id, aws_security_group.allow_spark.id]


	tags = {
            Name = "spark_worker_1"
    }

	connection {
			type = "ssh"
			user        = "ubuntu"
			private_key = file(var.keyPath)
			host = self.public_dns
	}

	provisioner "local-exec" {
			command = "echo ${aws_instance.spark_worker_1.private_ip}"
	}

	provisioner "file" {
			source = "script/script_spark_worker.sh"
			destination = "/tmp/script_spark_worker.sh"
	}

	provisioner "remote-exec" {
			inline = [
					"chmod +x /tmp/script_spark_worker.sh",
					"/tmp/script_spark_worker.sh",
			]
	}
}


resource "aws_instance" "spark_worker_2" {
	ami = lookup(var.AMIS, var.AWS_REGION)
	instance_type = "t2.large"
    key_name = "admin"
	private_ip = "172.31.48.81"
	subnet_id = "subnet-5403c365"
	monitoring = "true"
    vpc_security_group_ids = [aws_default_security_group.default.id, aws_security_group.allow_spark.id]


	tags = {
            Name = "spark_worker_2"
    }

	connection {
			type = "ssh"
			user        = "ubuntu"
			private_key = file(var.keyPath)
			host = self.public_dns
	}

	provisioner "local-exec" {
			command = "echo ${aws_instance.spark_worker_2.private_ip}"
	}

	provisioner "file" {
			source = "script/script_spark_worker.sh"
			destination = "/tmp/script_spark_worker.sh"
	}

	provisioner "remote-exec" {
			inline = [
					"chmod +x /tmp/script_spark_worker.sh",
					"/tmp/script_spark_worker.sh",
			]
	}
}


# resource "aws_instance" "spark_worker_3" {
# 	ami = lookup(var.AMIS, var.AWS_REGION)
# 	instance_type = "t2.large"
#     key_name = "admin"
# 	private_ip = "172.31.48.82"
# 	subnet_id = "subnet-5403c365"
# 	monitoring = "true"
#     vpc_security_group_ids = [aws_default_security_group.default.id, aws_security_group.allow_spark.id]


# 	tags = {
#             Name = "spark_worker_3"
#     }

# 	connection {
# 			type = "ssh"
# 			user        = "ubuntu"
# 			private_key = file(var.keyPath)
# 			host = self.public_dns
# 	}

# 	provisioner "local-exec" {
# 			command = "echo ${aws_instance.spark_worker_3.private_ip}"
# 	}

# 	provisioner "file" {
# 			source = "script/script_spark_worker.sh"
# 			destination = "/tmp/script_spark_worker.sh"
# 	}

# 	provisioner "remote-exec" {
# 			inline = [
# 					"chmod +x /tmp/script_spark_worker.sh",
# 					"/tmp/script_spark_worker.sh",
# 			]
# 	}
# }


resource "aws_instance" "spark_app" {
	ami = lookup(var.AMIS, var.AWS_REGION)
	instance_type = "t2.large"
    key_name = "admin"
	private_ip = "172.31.48.83"
	subnet_id = "subnet-5403c365"
	monitoring = "true"
    vpc_security_group_ids = [aws_default_security_group.default.id, aws_security_group.allow_spark.id]


	tags = {
            Name = "spark_app"
    }

	connection {
			type = "ssh"
			user        = "ubuntu"
			private_key = file(var.keyPath)
			host = self.public_dns
	}

	provisioner "local-exec" {
			command = "echo ${aws_instance.spark_app.private_ip}"
	}

	provisioner "file" {
			source = "script/script_spark_app.sh"
			destination = "/tmp/script_spark_app.sh"
	}

	provisioner "remote-exec" {
			inline = [
					"chmod +x /tmp/script_spark_app.sh",
					"/tmp/script_spark_app.sh",
			]
	}
}







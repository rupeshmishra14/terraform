provider "aws" {
	region = "us-east-1"
}

resource "aws_security_group" "my_security_group" {
	name = "first_sg"
	description = "security for ec2 instance created from terraform"
	
	ingress {
		from_port = 8080
		to_port = 8080
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	
	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	
	egress {
		from_port = 0
		to_port = 65535
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	
	tags= {
		Name = "first_sg"
	}
}

resource "aws_instance" "myFirstInstance" {
	ami = "ami-0ee23bfc74a881de5"
	key_name = "jenkins-key"
	instance_type = "t2.micro"
	security_group = ["first_sg"]
	tags= {
		Name = "ec2_instance"
	}
}
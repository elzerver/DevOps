provider "aws" {
  region = "us-east-1"
}

variable "list_example" {
  description = "An example of a list in Terraform"
  type        = "list"
  default     = [1, 2, 3]
}

variable "map_example" {
  description  = "An example of map in Terraform"
  type         = "map"
  default = {
    key1 = "value1"
    key2 = "value2"
    key3 = "value3"
  }
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default     = "8080"
}



resource "aws_instance" "example" {
  ami           = "ami-40d28157"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]

  user_data = <<-EOF
        #!/bin/bash
        echo "Hello world" > index.html
        nohup busybox httpd -f -p "${var.server_port}" &
        EOF
  tags {
    Name = "terraform-example"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = "${var.server_port}"
    to_port     = "${var.server_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "public_ip" {
  value = "${aws_instance.example.public_ip}"
}

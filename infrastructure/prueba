provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "jenkins" {
  ami  =  "ami-40d28157"
  instance_type  =  "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]
  tags {
    Name = "terraform-jenkins"
  }
}
resource "aws_security_group" "instance"
{
  name = "terraform-jenkins-instance"

  ingress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "public_ip" {
  value = "${aws_instance.jenkins.public_ip}"
}

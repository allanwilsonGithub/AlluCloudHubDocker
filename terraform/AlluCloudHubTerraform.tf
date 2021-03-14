provider "aws" {
  profile    = "default"
  region     = var.region
}

resource "aws_security_group" "allow_80_25565" {

  ingress {
    from_port       = 80
    to_port         = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 25565
    to_port         = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol    = -1
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allu_allow_80_25565"
  }
}

resource "aws_instance" "AlluCloudHubInstance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = "AlluHomeHub1"
  vpc_security_group_ids = ["sg-06b3f3e36969f0727"]

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
      "sudo add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable'",
      "sudo apt-get update",
      "sudo apt install docker.io -y",
      "sudo systemctl start docker",
      "git clone https://github.com/allanwilsonGithub/AlluCloudHubDocker.git",
      "cd AlluCloudHubDocker",
      "sudo ./run_docker.sh",
    ]

  connection {
    host = self.public_ip
    type = "ssh"
    user = "ubuntu"
    private_key = file("/DATA/certs/AlluHomeHub1.pem")

    }
  }
}

output "ip" {
  value = aws_instance.AlluCloudHubInstance.public_ip
}
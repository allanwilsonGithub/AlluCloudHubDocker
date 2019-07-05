provider "aws" {
  profile    = "default"
  region     = var.region
}

resource "aws_instance" "AlluCloudHubInstance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = "AlluHomeHub1"


  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt install docker.io -y",
      #"sudo systemctl start docker",
      #"git clone https://github.com/allanwilsonGithub/AlluCloudHubDocker.git",
      #"cd AlluCloudHubDocker",
      #"sudo ./run_docker.sh",
    ]

  connection {
    host = self.public_ip
    type = "ssh"
    user = "ubuntu"
    private_key = "${file("/DATA/certs/AlluHomeHub1.pem")}"
    }
  }
}

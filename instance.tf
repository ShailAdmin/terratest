resource "aws_instance" "r100c96" {
  ami               = "ami-08a0d1e16fc3f61ea"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  key_name          = "aws_key-1"
  tags = {
    Name = "Terraform-diff-linux"
  }

  provisioner "remote-exec" {
    inline = [ "sudo hostname" ]
    connection {
      host        = self.public_dns
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./aws_key-1.pem")
    }
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.r100c96.public_dns} > inventory"
  }

  provisioner "local-exec" {
    command = "ansible all -m shell -a 'yum -y install httpd git wget unzip; systemctl restart httpd; wget https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip; unzip oxer.zip; cp -rp oxer-html/* /var/www/html/' "
  }
}

output "ip" {
  value = aws_instance.r100c96.public_ip
}

output "publicName" {
  value = aws_instance.r100c96.public_dns
}

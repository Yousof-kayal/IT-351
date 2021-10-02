
resource "aws_instance" "my_instance" {
  ami           = "ami-087c17d1fe0178315"
  instance_type = "t2.micro"
  key_name = "CICD-lab-key"

  root_block_device {
    volume_size = 8
  }

  tags = {
    Name = "IsThisThingOn"

  }
}
  output "instance_ip" {
    value = aws_instance.my_instance.public_ip
  }
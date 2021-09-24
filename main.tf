
resource "aws_instance" "my_instance" {
  ami           = "ami-087c17d1fe0178315"
  instance_type = "t2.micro"

  root_block_device {
    volume_size = 8
  }

  tags = {
    Name = "YousofsFirstTFInstance"
  }
}
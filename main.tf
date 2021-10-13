  resource "aws_instance" "PipelineVM" {
      ami           = "ami-00e87074e52e6c9f9"
      instance_type = "t2.micro"
      key_name = "CICD-lab-key"
      security_groups = "${aws_security_group.Secure_Group.name}"

      root_block_device {
          volume_size = 15
      }

      tags = {
          Name = "PipelineInstance"
      }
  }
      output "instance_ip" {
          value = aws_instance.PipelineVM.public_ip
      }


  resource "aws_security_group" "Secure_Group" {
    name        = "Secure_Group"
    description = "Allow TLS inbound traffic"
    vpc_id      = "default"

    ingress {
        description      = "inbound from 22"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
      }
    

    ingress {
        description      = "inbound from 21"
        from_port        = 21
        to_port          = 21
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
      }
    

    ingress {
        description      = "inbound from 20"
        from_port        = 20
        to_port          = 20
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
      }
    

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
      }
    

    tags = {
      Name = "allow_22_21_20"
    }
  }

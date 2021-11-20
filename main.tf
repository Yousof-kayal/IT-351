  resource "aws_instance" "PipelineVM" {
      ami           = "ami-00e87074e52e6c9f9"
      instance_type = "t2.micro"
      key_name = "CICD-lab-key"

      root_block_device {
          volume_size = 15
      }

      tags = {
          Name = "PipelineInstance" ,
          Lab7 = "in-progress"
      }
  }
  
  resource "aws_instance" "sonarqube_instance" {
      ami           = "ami-000664695def16a6a"
      instance_type = "t3a.medium"
      key_name = "CICD-lab-key"
      vpc_security_group_ids = ["sg-08e3f3d88920746a8"]  
      
      root_block_device {
          volume_size = 10
      }
      tags = {
          Name = "YousofSonarQube"
      }
  }

      output "instance_ip" {
          value = aws_instance.PipelineVM.public_ip
      }

      output "sonarqube_ip" {
          value = aws_instance.sonarqube_instance.public_ip
      }

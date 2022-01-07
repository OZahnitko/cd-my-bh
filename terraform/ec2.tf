resource "aws_instance" "CD" {
  ami                    = data.aws_ami.ecs_ec2.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.deployer_key.key_name
  vpc_security_group_ids = [aws_security_group.ec2_cd.id]
  iam_instance_profile   = data.aws_iam_instance_profile.cd.name

  user_data = <<USER_DATA
    #!/bin/bash
    sudo yum update -y
    sudo yum install ruby -y
    sudo yum install wget -y
    wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
    chmod +x ./install
    sudo ./install auto
  USER_DATA

  tags = {
    Name        = "CD"
    Environment = "dev"
  }
}

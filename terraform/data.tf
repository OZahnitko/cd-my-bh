data "aws_iam_instance_profile" "ecs_profile" {
  name = "ecsInstanceRole"
}

data "aws_iam_instance_profile" "cd" {
  name = "EC2CodeDeploy"
}

data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_vpc" "default" {
  filter {
    name   = "is-default"
    values = [true]
  }
}

data "aws_ami" "ecs_ec2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-*-x86_64-ebs"]
  }
}


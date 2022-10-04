resource "aws_elastic_beanstalk_application" "devops-terraform-v35" {
  name        = "terraform"
  description = "application version created by terraform"

  tags = {
    Repo = var.repo
  }
}

resource "aws_elastic_beanstalk_environment" "devops-terraform-v35-env" {
  name                = "terraform"
  application         = aws_elastic_beanstalk_application.devops-terraform-v35.name
  solution_stack_name = "64bit Amazon Linux 2 v3.5.0 running Docker"
  tier                = "WebServer"

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.micro"
  }
}


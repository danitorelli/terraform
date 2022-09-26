resource "aws_elastic_beanstalk_application" "devops-terraform-danit" {
  name        = "terraform-danit"
  description = "application version created by terraform"

  tags = {
    Repo = var.repo
  }
}

resource "aws_elastic_beanstalk_environment" "devops-terraform-danit-env" {
  name                = "terraform-danit"
  application         = aws_elastic_beanstalk_application.devops-terraform-danit.name
  solution_stack_name = "64bit Amazon Linux 2 v3.4.19 running Docker"
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
  #setting {
  #  namespace = "aws:autoscaling:launchconfiguration"
  #  name      = "InstanceType"
  #  value     = "t2.micro"
  #}

}


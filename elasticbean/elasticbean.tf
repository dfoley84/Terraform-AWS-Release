resource "aws_elastic_beanstalk_application" "devtest" {
  name        = "Flask-Dev"
  description = "Testing Flask App within PaaS"
  solution_stack_name = "64bit Amazon Linux 2 v3.3.5 running Python 3.8"
}

resource "aws_elastic_beanstalk_environment" "testdev" {
  name = "Flask-Dev"
  application = aws_elastic_beanstalk_application.devtest.name
  solution_stack_name = "64bit Amazon Linux 2 v3.3.5 running Python 3.8"


  setting {
    namespace = "aws:ec2:vpc"
    name = "VPCId"
    value = var.vpc_id
  }

  setting {
    namespace = "aws:ec2:vpc"
    name = "Subnets"
    value = var.subnet_id
  }
}

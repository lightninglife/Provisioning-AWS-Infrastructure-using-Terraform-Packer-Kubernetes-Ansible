resource "aws_lb" "jenkins_alb" {
  name               = "jenkins-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = aws_subnet.jenkins_subnets[*].id
  enable_deletion_protection = false

  enable_http2               = true
  enable_cross_zone_load_balancing = true
  security_groups            = [aws_security_group.alb_sg.id]

  enable_deletion_protection = false

  enable_http2               = true
  enable_cross_zone_load_balancing = true
  security_groups            = [aws_security_group.alb_sg.id]
}

resource "aws_lb_listener" "jenkins_listener" {
  load_balancer_arn = aws_lb.jenkins_alb.arn
  port              = 8080
  protocol          = "HTTP"

  default_action {
    type             = "fixed-response"
    fixed_response {
      content_type    = "text/plain"
      status_code     = "200"
      message_body    = "OK"
    }
  }
}

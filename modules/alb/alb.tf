# # Create alb for Jenkins
# resource "aws_lb" "jenkins_alb" {
#   name               = var.jenkins_alb_name
#   internal           = var.jenkins_alb_internal # false
#   load_balancer_type = var.load_balancer_type_alb # "application"
#   subnets            = var.subnets
#   enable_deletion_protection       = var.enable_deletion_protection #false
#   enable_http2                     = var.enable_http2 # true
#   enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing #true
#   security_groups                  = [var.alb_security_group_ids]
  
# }

# resource "aws_lb_listener" "jenkins_listener" {
#   load_balancer_arn = aws_lb.jenkins_alb.arn
#   port              = var.port_8080
#   protocol          = var.protocol_web # "HTTP"

#   default_action {
#     type             = var.jenkins_listener_type # "fixed-response"
#     fixed_response {
#       content_type    = var.jenkins_listener_content_type # "text/plain"
#       status_code     = var.jenkins_listener_status_code # "200"
#       message_body    = var.jenkins_listener_message_body # "OK"
#     }
#   }
# }

# Create alb for Web Servers
resource "aws_lb" "web" {
  name               = var.web_alb_name
  internal           = var.web_alb_internal
  load_balancer_type = var.load_balancer_type_web
  security_groups    = [var.security_group]
  subnets            = var.subnets
}

resource "aws_lb_target_group" "web_tg" {
  name     = var.web_tg_name # "web-tg"
  port     = var.port_80 # 80
  protocol = var.protocol_web # "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "web_listener" {
  load_balancer_arn = aws_lb.web.arn
  port              = var.port_80 # "80"
  protocol          = var.protocol_web  # "HTTP"

  default_action {
    type             = var.web_listener_type # "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}
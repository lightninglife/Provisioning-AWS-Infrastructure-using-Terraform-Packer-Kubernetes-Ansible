# # ALB for Jenkins variables
# variable "jenkins_alb_name" {
#   description = "Name of the Jenkins ALB"
#   type        = string
# }

# variable "jenkins_alb_internal" {
#   description = "Whether the Jenkins ALB is internal"
#   type        = bool
# }

# variable "load_balancer_type_alb" {
#   description = "Type of the load balancer for Jenkins ALB"
#   type        = string
# }

# variable "enable_deletion_protection" {
#   description = "Whether to enable deletion protection for Jenkins ALB"
#   type        = bool
# }

# variable "enable_http2" {
#   description = "Whether to enable HTTP/2 for Jenkins ALB"
#   type        = bool
# }

# variable "enable_cross_zone_load_balancing" {
#   description = "Whether to enable cross-zone load balancing for Jenkins ALB"
#   type        = bool
# }

# variable "alb_security_group_ids" {
#   description = "List of security group IDs for Jenkins ALB"
#   type        = string
# }

# # ALB Listener for Jenkins variables
variable "protocol_web" {
  description = "Protocol for Jenkins ALB Listener"
  type        = string
}

# variable "jenkins_listener_type" {
#   description = "Type of action for Jenkins ALB Listener"
#   type        = string
# }

# variable "jenkins_listener_content_type" {
#   description = "Content type for Jenkins ALB Listener"
#   type        = string
# }

# variable "jenkins_listener_status_code" {
#   description = "Status code for Jenkins ALB Listener"
#   type        = string
# }

# variable "jenkins_listener_message_body" {
#   description = "Message body for Jenkins ALB Listener"
#   type        = string
# }

# ALB for Web Servers variables
variable "web_alb_name" {
  description = "Name of the example web ALB"
  type        = string
}

variable "web_alb_internal" {
  description = "Whether the example web ALB is internal"
  type        = bool
}

variable "load_balancer_type_web" {
  description = "Type of the load balancer for example web ALB"
  type        = string
}

# ALB Target Group for Web Servers variables
variable "web_tg_name" {
  description = "Name of the example web Target Group"
  type        = string
}

# ALB Listener for Web Servers variables
variable "web_listener_type" {
  description = "Type of action for example web ALB Listener"
  type        = string
}

variable "port_8080" {
  description = "Port for HTTP access for Jenkins (e.g., 8080)"
  type        = number
}

variable "port_80" {
  description = "Port for HTTP traffic (e.g., 80)"
  type        = number
}

variable "subnets" {
  description = "Subnets"
  type        = list(string)
}

variable "security_group" {
  description = "security_group"
  type        = string
}

variable "vpc_id" {
  description = "vpc id"
  type        = string
}


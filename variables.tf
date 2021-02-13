variable "website-domain-main" {
  description = "Main website domain, e.g. example.net"
  type        = string
}

variable "prefix_subdomain" {
  default = "docs"
}

variable "route53_zone_id" {}

variable "acm_certificate_arn" {}


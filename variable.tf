variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}
 
variable "project_name" {
  description = "Prefix used for resource names"
  type        = string
  default     = "url-shortener"
}
 
variable "hosted_zone_name" {
  description = "Existing Route 53 public hosted zone, e.g. example.com"
  type        = string
}
 
variable "domain_name" {
  description = "Custom domain for the API, e.g. short.example.com"
  type        = string
}
 
variable "stage_name" {
  description = "API Gateway stage name"
  type        = string
  default     = "prod"
}
 
variable "log_retention_days" {
  description = "CloudWatch log retention in days"
  type        = number
  default     = 14
}
 
variable "waf_rate_limit" {
  description = "Max requests per 5 minutes from a single IP before WAF blocks it"
  type        = number
  default     = 1000
}
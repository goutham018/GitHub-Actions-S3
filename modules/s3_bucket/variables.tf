
variable "bucket_name" {}
variable "lambda_function_arn" {}
variable "filter_prefix" {
  default = "logs/"
}

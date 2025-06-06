
resource "aws_s3_bucket" "ci_failure_logs" {
  bucket = var.bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_notification" "lambda_trigger" {
  bucket = aws_s3_bucket.ci_failure_logs.id

  lambda_function {
    lambda_function_arn = var.lambda_function_arn
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = var.filter_prefix
  }
}

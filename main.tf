
provider "aws" {
  region = "us-east-1"
}

module "lambda" {
  source              = "./modules/lambda_function"
  function_name       = "ci_log_processor"
  lambda_code_bucket  = "your-lambda-code-bucket"
  lambda_code_key     = "lambda_ci_log_processor.zip"
}

module "s3" {
  source              = "./modules/s3_bucket"
  bucket_name         = "ci-failure-logs-bucket"
  lambda_function_arn = module.lambda.lambda_function_arn
}

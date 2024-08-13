# Test Lambda Fucntion helloworld with URL

provider "aws" {
  region = "ap-southeast-1"

  # Make it faster by skipping something
  skip_metadata_api_check     = true
  skip_region_validation      = true
  skip_credentials_validation = true
}

data "aws_caller_identity" "current" {}

module "lambda_function" {
  source = "../"

  function_name = "Lambdatest"
  description   = "Testing lambda fuction"
  create_role = false
  lambda_role   = "arn:aws:iam::637423165302:role/Lambda_Admin"
  handler       = "hello_world.lambda_handler"
  source_path   = "hello_world.py"
  runtime       = "python3.12"

  tags = {
    Name = "test-lambda"
  }

  create_lambda_function_url = true
  authorization_type         = "NONE"
  cors = {
    allow_credentials = true
    allow_origins     = ["*"]
    allow_methods     = ["*"]
    allow_headers     = ["date", "keep-alive"]
    expose_headers    = ["keep-alive", "date"]
    max_age           = 86400
  }
  invoke_mode = "RESPONSE_STREAM"
}

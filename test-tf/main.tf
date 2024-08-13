provider "aws" {
  region = "ap-southeast-1"

  # Make it faster by skipping something
  skip_metadata_api_check     = true
  skip_region_validation      = true
  skip_credentials_validation = true
}

data "aws_caller_identity" "current" {}

# data "aws_organizations_organization" "this" {}

module "lambda_function" {
  source = "../"

  create        = true
  function_name = "Lambdatest"
  description   = "Testing lambda fuction"
  lambda_role   = "arn:aws:iam::637423165302:role/Lambda_Admin"
  handler       = "hello_world.lambda_handler"
  source_path   = "hello_world.py"
  runtime       = "python3.12"

  tags = {
    Name = "my-lambda1"
  }
}

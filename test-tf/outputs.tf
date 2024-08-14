output "lambda_function_url" {
  description = "The URL of the Lambda Function URL"
  value       = module.lambda_function.lambda_function_url
}

output "lambda_invocattion_result" {
  description = "String result of the lambda function invocation."
  value = module.lambda_function.lambda_invocattion_result
}
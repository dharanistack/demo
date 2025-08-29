output "s3_bucket_name" {
  description = "The name of the S3 bucket."
  value       = aws_s3_bucket.webapp_bucket.bucket
}

output "lambda_function_url" {
  description = "The URL of the Lambda function."
  value       = aws_lambda_function_url.webapp_lambda_url.function_url
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "webapp_bucket" {
  bucket = var.s3_bucket_name
  acl    = "private"
}

resource "aws_lambda_function" "webapp_lambda" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_exec.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  filename      = "lambda_function_payload.zip"

  environment {
    variables = {
      BUCKET_NAME = aws_s3_bucket.webapp_bucket.bucket
    }
  }
}

resource "aws_lambda_function_url" "webapp_lambda_url" {
  function_name      = aws_lambda_function.webapp_lambda.function_name
  authorization_type = "NONE"
}

resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Effect = "Allow",
        Sid    = ""
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_db_instance" "webapp_db" {
  identifier           = var.db_identifier
  allocated_storage    = var.db_allocated_storage
  engine               = "mysql"
  instance_class       = var.db_instance_class
  name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}
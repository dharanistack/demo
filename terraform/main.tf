module "stackgen_561942a9-2b22-4f57-a39c-5e841c929721" {
  source               = "./modules/custom_webapp_1.0.2_3"
  aws_region           = "us-west-2"
  lambda_function_name = "read"
  s3_bucket_name       = "bucket"
}


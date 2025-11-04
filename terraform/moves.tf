moved {
  from = aws_route_table_association.private_association[1]
  to   = module.stackgen_c585a9fa-3424-5209-b0d1-711ccf42498d.aws_route_table_association.this
}

moved {
  from = aws_subnet.private_subnet[1]
  to   = module.stackgen_76fd892b-f4cc-5202-8495-a5406b0729d9.aws_subnet.this
}

moved {
  from = aws_vpc.main_vpc
  to   = module.stackgen_17d06135-be6a-5962-a85d-ac5314e88b76.aws_vpc.this
}

moved {
  from = aws_s3_bucket.data_bucket
  to   = module.stackgen_9069a3e8-730a-5152-afcd-2902d6871429.aws_s3_bucket.this
}

moved {
  from = aws_cloudwatch_log_group.lambda_log_group
  to   = module.stackgen_949890a2-e3ef-5c60-8e43-34d47d31b3f5.aws_cloudwatch_log_group.this
}

moved {
  from = aws_instance.ec2_instance
  to   = module.stackgen_7fde6093-ec66-5bb9-9f82-133dfe6f8dae.aws_instance.this
}

moved {
  from = aws_iam_role_policy_attachment.lambda_policy_attach
  to   = module.stackgen_e544d5a2-37bd-5b39-a811-82782ef37689.aws_iam_role_policy_attachment.this
}

moved {
  from = aws_iam_role.lambda_execution_role
  to   = module.stackgen_39584f24-c1f5-57bf-b2f8-6eb862a67d39.aws_iam_role.this
}

moved {
  from = aws_route.default_route
  to   = module.stackgen_c517590d-0c78-5b9a-936f-2e2c7245028f.aws_route.this
}

moved {
  from = aws_internet_gateway.igw
  to   = module.stackgen_49a7552b-72d3-594a-85d0-93e0641001f3.aws_internet_gateway.this
}

moved {
  from = aws_route_table.public_rt
  to   = module.stackgen_750c9fd0-8971-5c2b-9108-acca15204a66.aws_route_table.this
}

moved {
  from = aws_dynamodb_table.main_table
  to   = module.stackgen_9c1d6ee8-c47a-56bd-95b8-6d93150a5b3d.aws_dynamodb_table.this
}

moved {
  from = aws_subnet.private_subnet[0]
  to   = module.stackgen_f16efc42-7c9a-5789-88af-16fdf8fe4ad7.aws_subnet.this
}

moved {
  from = aws_route_table_association.private_association[0]
  to   = module.stackgen_b07c89d2-eb19-51c5-ad4d-c47709e14e4d.aws_route_table_association.this
}

moved {
  from = aws_lambda_function.my_lambda
  to   = module.stackgen_a8b5f2d5-a0be-5d27-8c8e-cc9ed737740e.aws_lambda_function.this
}


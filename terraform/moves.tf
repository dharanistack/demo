moved {
  from = aws_vpc.main_vpc
  to   = module.stackgen_17d06135-be6a-5962-a85d-ac5314e88b76.aws_vpc.this
}

moved {
  from = aws_subnet.private_subnet[1]
  to   = module.stackgen_76fd892b-f4cc-5202-8495-a5406b0729d9.aws_subnet.this
}

moved {
  from = aws_instance.ec2_instance
  to   = module.stackgen_7fde6093-ec66-5bb9-9f82-133dfe6f8dae.aws_instance.this
}


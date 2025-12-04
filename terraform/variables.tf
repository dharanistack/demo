variable "region" {
  description = "AWS region in which the project needs to be setup (us-east-1, ca-west-1, eu-west-3, etc)"
}

variable "bucket_name" {
  default     = null
  description = "The name of the s3 bucket"
  type        = string
  nullable    = true
  sensitive   = false
}

variable "ecs_cluster_name" {
  default     = "prod-ecs-cluster"
  description = "Name of the ECS Cluster"
  type        = string
  nullable    = false
  sensitive   = false
}

variable "ecs_task_image_url" {
  default     = "nginx:latest"
  description = "URL of the Docker image for the task"
  type        = string
  nullable    = false
  sensitive   = false
}


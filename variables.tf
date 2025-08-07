variable "aws_region" { 
  default = "us-east-1" 
}
variable "repository_name" { 
  default = "hello-lambda" 
}
variable "lambda_name" { 
  default = "hello-docker-lambda" 
}
variable "image_uri" { 
  description = "ECR image URI with tag (updated by CI/CD)" 
}
variable "api_name" { 
  default = "docker-python" 
}
variable "stage_name" { 
  default = "test" 
}

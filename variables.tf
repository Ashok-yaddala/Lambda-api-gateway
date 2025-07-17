variable "aws_region"     { 
  default = "ap-south-1" 
}
variable "repository_name" { 
  default = "hello-lambda" 
}
variable "lambda_name"    { 
  default = "hello-docker-lambda" 
}
variable "image_uri"      { 
  description = "ECR image URI with tag (set manually after push)" 
}
variable "api_name"       { 
  default = "docker-python" 
}
variable "stage_name"     { 
  default = "test" 
}

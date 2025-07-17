provider "aws" {
  region = var.aws_region
}

module "ecr" {
  source           = "./modules/ecr"
  repository_name  = var.repository_name
}

# Build and push Docker image outside of Terraform, get the image URI from ECR
# (You can use terraform 'null_resource' and 'local-exec' to automate docker build/push if desired)

resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json
}

data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "lambda_basic" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

module "lambda" {
  source     = "./modules/lambda"
  lambda_name = var.lambda_name
  image_uri   = var.image_uri
  role_arn    = aws_iam_role.lambda_exec.arn
}

module "apigateway" {
  source                = "./modules/apigateway"
  api_name              = var.api_name
  lambda_invoke_arn     = module.lambda.lambda_arn
  lambda_function_name  = var.lambda_name
  stage_name            = var.stage_name
}

output "api_invoke_url" {
  value = module.apigateway.invoke_url
}

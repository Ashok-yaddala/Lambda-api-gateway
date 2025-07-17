
module "lambda" {
  source      = "./modules/lambda"
  lambda_name = var.lambda_name
  image_uri   = var.image_uri
}

module "apigateway" {
  source             = "./modules/apigateway"
  api_name           = var.api_name
  region             = var.aws_region
  lambda_invoke_arn  = module.lambda.lambda_arn
  lambda_name        = module.lambda.lambda_name
  stage_name         = var.stage_name
}


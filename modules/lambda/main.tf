resource "aws_lambda_function" "this" {
  function_name = var.lambda_name
  package_type  = "Image"
  image_uri     = var.image_uri
  role          = var.role_arn
  timeout       = 10
  tracing_config {
    mode = "Active"
  }
}



output "lambda_arn" { 
  value = aws_lambda_function.this.arn 
}
output "xray_enabled" {
  value = aws_lambda_function.this.tracing_config[0].mode
}

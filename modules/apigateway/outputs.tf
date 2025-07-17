output "invoke_url" {
  value = "${aws_api_gateway_rest_api.this.execution_arn}/${var.stage_name}/hello"
}

data "archive_file" "create_url" {
  type        = "zip"
  source_dir  = "${path.module}/src/create_url"
  output_path = "${path.module}/build/create_url.zip"
}
 
data "archive_file" "retrieve_url" {
  type        = "zip"
  source_dir  = "${path.module}/src/retrieve_url"
  output_path = "${path.module}/build/retrieve_url.zip"
}
 
# Log groups created up front so retention is managed by Terraform
resource "aws_cloudwatch_log_group" "create_url" {
  name              = "/aws/lambda/${var.project_name}-create-url"
  retention_in_days = var.log_retention_days
}
 
resource "aws_cloudwatch_log_group" "retrieve_url" {
  name              = "/aws/lambda/${var.project_name}-retrieve-url"
  retention_in_days = var.log_retention_days
}
 
resource "aws_lambda_function" "create_url" {
  function_name    = "${var.project_name}-create-url"
  role             = aws_iam_role.create_url.arn
  runtime          = "python3.12"
  handler          = "app.handler"
  filename         = data.archive_file.create_url.output_path
  source_code_hash = data.archive_file.create_url.output_base64sha256
  timeout          = 10
  memory_size      = 128
 
  tracing_config {
    mode = "Active"
  }
 
  environment {
    variables = {
      TABLE_NAME = aws_dynamodb_table.urls.name
      BASE_URL   = "https://${var.domain_name}"
    }
  }
 
  depends_on = [aws_cloudwatch_log_group.create_url]
}
 
resource "aws_lambda_function" "retrieve_url" {
  function_name    = "${var.project_name}-retrieve-url"
  role             = aws_iam_role.retrieve_url.arn
  runtime          = "python3.12"
  handler          = "app.handler"
  filename         = data.archive_file.retrieve_url.output_path
  source_code_hash = data.archive_file.retrieve_url.output_base64sha256
  timeout          = 5
  memory_size      = 128
 
  tracing_config {
    mode = "Active"
  }
 
  environment {
    variables = {
      TABLE_NAME = aws_dynamodb_table.urls.name
    }
  }
 
  depends_on = [aws_cloudwatch_log_group.retrieve_url]
}
 
# Allow API Gateway to invoke the functions
resource "aws_lambda_permission" "create_url" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.create_url.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.this.execution_arn}/*/POST/newurl"
}
 
resource "aws_lambda_permission" "retrieve_url" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.retrieve_url.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.this.execution_arn}/*/GET/*"
}
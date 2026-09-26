resource "aws_iam_role_policy_attachment" "create_url_logs" {
  role       = aws_iam_role.create_url_lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "retrieve_url_logs" {
  role       = aws_iam_role.retrieve_url_lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
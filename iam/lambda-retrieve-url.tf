resource "aws_iam_role" "retrieve_url_lambda" {
  name = "retrieve-url-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "lambda.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })
}


# Allow Retrieve URL Lambda to read DynamoDB

resource "aws_iam_role_policy" "retrieve_url_dynamodb" {
  name = "retrieve-url-dynamodb-policy"

  role = aws_iam_role.retrieve_url_lambda.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "dynamodb:GetItem"
        ]

        Resource = aws_dynamodb_table.urls.arn
      }
    ]
  })
}
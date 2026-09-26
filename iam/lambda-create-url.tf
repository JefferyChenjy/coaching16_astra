resource "aws_iam_role" "create_url_lambda" {
  name = "create-url-lambda-role"

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


# Allow Create URL Lambda to write to DynamoDB

resource "aws_iam_role_policy" "create_url_dynamodb" {
  name = "create-url-dynamodb-policy"

  role = aws_iam_role.create_url_lambda.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "dynamodb:PutItem"
        ]

        Resource = aws_dynamodb_table.urls.arn
      }
    ]
  })
}
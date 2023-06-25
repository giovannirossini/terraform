# Create AWS Lambda function
resource "aws_lambda_function" "backend_lambda" {
  function_name    = "check-connection" # Update with your desired function name
  runtime          = "python3.10"
  handler          = "main.lambda_handler"
  filename         = "${path.module}/src/lambda/lambda_function.zip"                   # Update with the path to your Lambda function code ZIP file
  source_code_hash = filebase64sha256("${path.module}/src/lambda/lambda_function.zip") # Update with the path to your Lambda function code ZIP file

  role = aws_iam_role.lambda_execution_role.arn # Update with the ARN of the IAM role for Lambda execution

  environment {
    variables = {
      DB_HOST     = aws_db_instance.rds_instance.address,
      DB_USER     = aws_db_instance.rds_instance.username,
      DB_PASSWORD = aws_db_instance.rds_instance.password,
      DB_NAME     = aws_db_instance.rds_instance.db_name
    }
  }

  vpc_config {
    subnet_ids         = [data.aws_subnets.current.ids[0]]
    security_group_ids = ["sg-0fdaaa399e364821f"]
  }
}

resource "aws_iam_role" "lambda_execution_role" {
  name = "lambda_execution_role"

  assume_role_policy = file("${path.module}/templates/lambda.json")
}

resource "aws_iam_policy_attachment" "lambda_role_attachment" {
  name       = "lambda-rds-access-attachment"
  roles      = [aws_iam_role.lambda_execution_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess" # Adjust the policy according to your requirements
}

resource "aws_lambda_function_url" "backend_lambda_latest" {
  function_name      = aws_lambda_function.backend_lambda.function_name
  authorization_type = "NONE"
}

resource "aws_iam_policy" "lambda_execution_policy" {
  name        = "lambda-execution-policy"
  description = "Policy for Lambda execution role"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:CreateNetworkInterface",
        "ec2:DescribeNetworkInterfaces",
        "ec2:DeleteNetworkInterface"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_execution_attachment" {
  role       = aws_iam_role.lambda_execution_role.name
  policy_arn = aws_iam_policy.lambda_execution_policy.arn
}
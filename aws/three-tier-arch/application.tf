# # Create AWS Lambda function
# resource "aws_lambda_function" "backend_lambda" {
#   function_name    = "check-connection" # Update with your desired function name
#   runtime          = "python3.10"
#   handler          = "main.lambda_handler"
#   filename         = "${path.module}/src/lambda/lambda_function.zip"                   # Update with the path to your Lambda function code ZIP file
#   source_code_hash = filebase64sha256("${path.module}/src/lambda/lambda_function.zip") # Update with the path to your Lambda function code ZIP file

#   role = aws_iam_role.lambda_execution_role.arn # Update with the ARN of the IAM role for Lambda execution

#   environment {
#     variables = {
#       DB_HOST     = module.mysql.endpoint,
#       DB_USER     = module.mysql.username,
#       DB_PASSWORD = module.mysql.password,
#       DB_NAME     = module.mysql.db_name
#     }
#   }

#   vpc_config {
#     subnet_ids         = [for i in module.network.private_subnet : i]
#     security_group_ids = [aws_security_group.sg_lambda.id]
#   }
# }

# resource "aws_iam_policy" "lambda_policy" {
#   name        = "LAP"
#   description = "Policy to allow access to all Lambda functions"

#   policy = file("${path.module}/templates/lambda_policy.json")
# }

# resource "aws_iam_role" "lambda_execution_role" {
#   name = "lambda_execution_role"

#   assume_role_policy = file("${path.module}/templates/lambda.json")
# }

# resource "aws_iam_policy_attachment" "lambda_role_attachment2" {
#   name       = "lambda-rds-access-attachment"
#   roles      = [aws_iam_role.lambda_execution_role.name]
#   policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess" # Adjust the policy according to your requirements
# }

# resource "aws_iam_policy_attachment" "lambda_role_attachment" {
#   name       = "lambda-access-attachment"
#   roles      = [aws_iam_role.lambda_execution_role.name]
#   policy_arn = aws_iam_policy.lambda_policy.arn
# }

# resource "aws_lambda_function_url" "backend_lambda_latest" {
#   function_name      = aws_lambda_function.backend_lambda.function_name
#   authorization_type = "NONE"
# }

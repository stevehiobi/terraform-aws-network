resource "aws_cloudwatch_log_group" "vpc-log" {
  name              = "/aws/vpc/${var.project}-${var.environment}/flow"
  retention_in_days = 30

  tags = {
    Name        = "${var.project}-${var.environment}-vpc-cloudwatch-log-group"
    Environment = var.environment
  }
}

resource "aws_flow_log" "main" {
  iam_role_arn    = aws_iam_role.vpc-flow-logs-role.arn
  log_destination = aws_cloudwatch_log_group.vpc-log.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.main.id
}

resource "aws_iam_role" "vpc-flow-logs-role" {
  name = "${var.project}-${var.environment}-vpc-flow-logs-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "vpc-flow-logs-policy" {
  name = "${var.project}-${var.environment}-vpc-flow-logs-policy"
  role = aws_iam_role.vpc-flow-logs-role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
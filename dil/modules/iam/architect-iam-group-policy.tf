resource "aws_iam_group_policy" "architect_policy" {
  name  = "architect_policy"
  group = aws_iam_group.Architect.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*"
    }
  ]
}
EOF
}

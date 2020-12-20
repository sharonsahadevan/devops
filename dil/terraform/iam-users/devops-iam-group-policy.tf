resource "aws_iam_group_policy" "devops_policy" {
  name  = "devops_policy"
  group = aws_iam_group.Devops.name

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

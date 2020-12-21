resource "aws_iam_group_policy" "developer_policy" {
  name  = "developer_policy"
  group = aws_iam_group.Developer.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*",
                "ec2:*",
                "elasticmapreduce:*",
                "eks:*"
            ],
            "Resource": "*"
        }
    ]
}


EOF
}

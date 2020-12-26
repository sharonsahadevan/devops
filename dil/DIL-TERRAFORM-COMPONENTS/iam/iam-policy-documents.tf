

data "aws_iam_policy_document" "developer" {
  statement {
    actions = [
      "s3:ListBuckets",
    ]

    resources = ["*"]
  }
}



data "aws_iam_policy_document" "tester-policy" {
  statement {
    actions = [
      "s3:ListBuckets",
    ]

    resources = ["*"]
  }
}


data "aws_iam_policy_document" "dev-custom-policy" {
  statement {
    actions = [
      "s3:ListBuckets",
    ]

    resources = ["*"]
  }
}

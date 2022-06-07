data "aws_iam_policy_document" "get_course" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "get_course" {
  name               = "${module.label.id}-get-course"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.get_course.json
}
resource "aws_iam_role_policy_attachment" "get_course" {
  role       = aws_iam_role.get_course.name
  policy_arn = aws_iam_policy.get_course.arn
}

resource "aws_iam_role_policy_attachment" "get_course_cloudwatch" {
  role       = aws_iam_role.get_course.name
  policy_arn = aws_iam_policy.get_course_cloudwatch.arn
}

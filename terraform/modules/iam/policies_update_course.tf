data "aws_iam_policy_document" "update_course_dynamo" {
  statement {
    sid = "dynamodb"

    actions = [
     "dynamodb:DescribeTable",
     "dynamodb:GetItem",
     "dynamodb:UpdateItem",
     "dynamodb:ListBackups",
     "dynamodb:Query",
     "dynamodb:Scan"
    ]

    resources = [
    "${var.dynamo_db_updatecourse_arn}",
    #"${var.dynamo_db_updatecourse_arn}/*"
    ]
  }
  }

resource "aws_iam_policy" "update_course" {
  name   = "${module.label.id}-update-course"
  path   = "/"
  policy = data.aws_iam_policy_document.update_course_dynamo.json
}

data "aws_iam_policy_document" "update_course_cloudwatch" {
  statement {
    sid = "cloudwatch"

    actions = [
     "logs:CreateLogStream",
     "logs:PutLogEvents"
    ]

    resources = [
    var.cw_log_group_update_course_arn,
    "${var.cw_log_group_update_course_arn}:*"
    ]
  }
  }

resource "aws_iam_policy" "update_course_cloudwatch" {
  name   = "${module.label.id}-update-course-cw"
  path   = "/"
  policy = data.aws_iam_policy_document.update_course_cloudwatch.json
}

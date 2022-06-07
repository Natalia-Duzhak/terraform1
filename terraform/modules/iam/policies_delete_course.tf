data "aws_iam_policy_document" "delete_course_dynamo" {
  statement {
    sid = "dynamodb"

    actions = [
     "dynamodb:DeleteItem"
     ]

    resources = [
    "${var.dynamo_db_deletecourse_arn}",
    #"${var.dynamo_db_deletecourse_arn}/*"
    ]
  }
  }

resource "aws_iam_policy" "delete_course" {
  name   = "${module.label.id}-delete-course"
  path   = "/"
  policy = data.aws_iam_policy_document.delete_course_dynamo.json
}

data "aws_iam_policy_document" "delete_course_cloudwatch" {
  statement {
    sid = "cloudwatch"

    actions = [
     "logs:CreateLogStream",
     "logs:PutLogEvents"
    ]

    resources = [
    var.cw_log_group_delete_course_arn,
    "${var.cw_log_group_delete_course_arn}:*"
    ]
  }
  }

resource "aws_iam_policy" "delete_course_cloudwatch" {
  name   = "${module.label.id}-delete-course-cw"
  path   = "/"
  policy = data.aws_iam_policy_document.delete_course_cloudwatch.json
}

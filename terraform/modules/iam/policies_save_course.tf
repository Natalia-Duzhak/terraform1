data "aws_iam_policy_document" "save_course_dynamo" {
  statement {
    sid = "dynamodb"

    actions = [
     "dynamodb:GetItem",
     "dynamodb:PutItem",
     "dynamodb:ListBackups",
     "dynamodb:Query",
     "dynamodb:Scan"
    ]

    resources = [
    "${var.dynamo_db_savecourse_arn}",
    #"${var.dynamo_db_savecourse_arn}/*"
    ]
  }
  }

resource "aws_iam_policy" "save_course" {
  name   = "${module.label.id}-save-course"
  path   = "/"
  policy = data.aws_iam_policy_document.save_course_dynamo.json
}

data "aws_iam_policy_document" "save_course_cloudwatch" {
  statement {
    sid = "cloudwatch"

    actions = [
     "logs:CreateLogStream",
     "logs:PutLogEvents"
    ]

    resources = [
    var.cw_log_group_save_course_arn,
    "${var.cw_log_group_save_course_arn}:*"
    ]
  }
  }

resource "aws_iam_policy" "save_course_cloudwatch" {
  name   = "${module.label.id}-save-course-cw"
  path   = "/"
  policy = data.aws_iam_policy_document.save_course_cloudwatch.json
}

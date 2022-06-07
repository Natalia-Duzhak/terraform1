module "notification_label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"
  context = module.base_labels.context
  name    = "notification"
}

module "notify_slack" {
  source  = "terraform-aws-modules/notify-slack/aws"
  version = "5.1.0"

  sns_topic_name = module.notification_label.id

  slack_webhook_url = "https://hooks.slack.com/services/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"
  slack_channel     = "aws-notification"
  slack_username    = "terraform-reporter"
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = module.notify_slack.slack_topic_arn
  protocol  = "email"
  endpoint  = "nataliia.duzhak.itis.2020@lpnu.ua"
}

resource "aws_cloudwatch_log_metric_filter" "get_all_courses" {
  name           = module.notification_label.id
  pattern        = "?ERROR ?WARN ?5xx"
  log_group_name = "/aws/lambda/${module.lambda.get_all_courses_lambda_function_name}"

  metric_transformation {
    name      = module.notification_label.id
    namespace = module.notification_label.id
    value     = "1"
  }
}

 resource "aws_cloudwatch_metric_alarm" "get_all_courses" {
  alarm_name          = module.notification_label.id
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = module.notification_label.id
  namespace           = module.notification_label.id
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "This metric monitors ${module.lambda.get_all_courses_lambda_function_name}"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [module.notify_slack.slack_topic_arn]
}

resource "aws_cloudwatch_log_metric_filter" "get_all_authors" {
  name           = module.notification_label.id
  pattern        = "?ERROR ?WARN ?5xx"
  log_group_name = "/aws/lambda/${module.lambda.get_all_authors_lambda_function_name}"

  metric_transformation {
    name      = module.notification_label.id
    namespace = module.notification_label.id
    value     = "1"
  }
}

 resource "aws_cloudwatch_metric_alarm" "get_all_authors" {
  alarm_name          = module.notification_label.id
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = module.notification_label.id
  namespace           = module.notification_label.id
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "This metric monitors ${module.lambda.get_all_authors_lambda_function_name}"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [module.notify_slack.slack_topic_arn]
}

resource "aws_cloudwatch_log_metric_filter" "get_course" {
  name           = module.notification_label.id
  pattern        = "?ERROR ?WARN ?5xx"
  log_group_name = "/aws/lambda/${module.lambda.get_course_lambda_function_name}"

  metric_transformation {
    name      = module.notification_label.id
    namespace = module.notification_label.id
    value     = "1"
  }
}

 resource "aws_cloudwatch_metric_alarm" "get_course" {
  alarm_name          = module.notification_label.id
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = module.notification_label.id
  namespace           = module.notification_label.id
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "This metric monitors ${module.lambda.get_course_lambda_function_name}"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [module.notify_slack.slack_topic_arn]
}

resource "aws_cloudwatch_log_metric_filter" "save_course" {
  name           = module.notification_label.id
  pattern        = "?ERROR ?WARN ?5xx"
  log_group_name = "/aws/lambda/${module.lambda.save_course_lambda_function_name}"

  metric_transformation {
    name      = module.notification_label.id
    namespace = module.notification_label.id
    value     = "1"
  }
}

 resource "aws_cloudwatch_metric_alarm" "save_course" {
  alarm_name          = module.notification_label.id
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = module.notification_label.id
  namespace           = module.notification_label.id
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "This metric monitors ${module.lambda.save_course_lambda_function_name}"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [module.notify_slack.slack_topic_arn]
}

resource "aws_cloudwatch_log_metric_filter" "update_course" {
  name           = module.notification_label.id
  pattern        = "?ERROR ?WARN ?5xx"
  log_group_name = "/aws/lambda/${module.lambda.update_course_lambda_function_name}"

  metric_transformation {
    name      = module.notification_label.id
    namespace = module.notification_label.id
    value     = "1"
  }
}

 resource "aws_cloudwatch_metric_alarm" "update_course" {
  alarm_name          = module.notification_label.id
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = module.notification_label.id
  namespace           = module.notification_label.id
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "This metric monitors ${module.lambda.update_course_lambda_function_name}"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [module.notify_slack.slack_topic_arn]
}

resource "aws_cloudwatch_log_metric_filter" "delete_course" {
  name           = module.notification_label.id
  pattern        = "?ERROR ?WARN ?5xx"
  log_group_name = "/aws/lambda/${module.lambda.delete_course_lambda_function_name}"

  metric_transformation {
    name      = module.notification_label.id
    namespace = module.notification_label.id
    value     = "1"
  }
}

 resource "aws_cloudwatch_metric_alarm" "delete_course" {
  alarm_name          = module.notification_label.id
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = module.notification_label.id
  namespace           = module.notification_label.id
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "This metric monitors ${module.lambda.delete_course_lambda_function_name}"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [module.notify_slack.slack_topic_arn]
}

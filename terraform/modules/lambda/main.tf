locals {
  log_retention = 3
}

module "label" {
  source = "cloudposse/label/null"
  version = "0.25.0"
  context = var.context
  name = var.name
  }

module "label_get_all_authors" {
  source  = "cloudposse/label/null"
  version = "0.25.0"
  context = var.context
  name    = "get-all-authors"
}

module "label_get_all_courses" {
  source  = "cloudposse/label/null"
  version = "0.25.0"
  context = var.context
  name    = "get-all-courses"
}

data "aws_region" "current" {}

module "lambda_function_get_all_authors" {
  source = "terraform-aws-modules/lambda/aws"
  version = "3.2.0"

  function_name = module.label_get_all_authors.id
  description   = "get all authors"
  handler       = "index.handler"
  runtime       = "nodejs12.x"
  create_role   = false
  lambda_role   = var.get_all_authors_role_arn
  use_existing_cloudwatch_log_group = true
  cloudwatch_logs_retention_in_days = 3

  source_path = "${path.module}/lambda_source/get_all_authors/index.js"

 environment_variables = {
    TABLE_NAME = var.dynamo_db_authors_name

  }
 
  tags = module.label.tags
}

module "lambda_function_get_all_courses" {
  source = "terraform-aws-modules/lambda/aws"
  version = "3.2.0"

  function_name = module.label_get_all_courses.id
  description   = "get all courses"
  handler       = "index.handler"
  runtime       = "nodejs12.x"
  create_role   = false
  lambda_role   = var.get_all_courses_role_arn
  use_existing_cloudwatch_log_group = true
  cloudwatch_logs_retention_in_days = 3

  source_path = "${path.module}/lambda_source/get_all_courses/index.js"

 environment_variables = {
    TABLE_NAME = var.dynamo_db_courses_name

  }
 
  tags = module.label.tags
}

module "lambda_function_get_course" {
  source = "terraform-aws-modules/lambda/aws"
  version = "3.2.0"

  function_name = "${module.label.id}-get_course"
  description   = "get course"
  handler       = "index.handler"
  runtime       = "nodejs12.x"
  create_role   = false
  lambda_role   = var.get_course_role_arn
  use_existing_cloudwatch_log_group = true
  cloudwatch_logs_retention_in_days = 3

  source_path = "${path.module}/lambda_source/get_course/index.js"

 environment_variables = {
    TABLE_NAME = var.dynamo_db_course_name

  }
 
  tags = module.label.tags
}

module "lambda_function_save_course" {
  source = "terraform-aws-modules/lambda/aws"
  version = "3.2.0"

  function_name = "${module.label.id}-save_course"
  description   = "save course"
  handler       = "index.handler"
  runtime       = "nodejs12.x"
  create_role   = false
  lambda_role   = var.save_course_role_arn
  use_existing_cloudwatch_log_group = true
  cloudwatch_logs_retention_in_days = 3

  source_path = "${path.module}/lambda_source/save_course/index.js"

 environment_variables = {
    TABLE_NAME = var.dynamo_db_savecourse_name

  }
 
  tags = module.label.tags
}

module "lambda_function_update_course" {
  source = "terraform-aws-modules/lambda/aws"
  version = "3.2.0"

  function_name = "${module.label.id}-update_course"
  description   = "update course"
  handler       = "index.handler"
  runtime       = "nodejs12.x"
  create_role   = false
  lambda_role   = var.update_course_role_arn
  use_existing_cloudwatch_log_group = true
  cloudwatch_logs_retention_in_days = 3

  source_path = "${path.module}/lambda_source/update_course/index.js"

 environment_variables = {
    TABLE_NAME = var.dynamo_db_updatecourse_name

  }
 
  tags = module.label.tags
}

module "lambda_function_delete_course" {
  source = "terraform-aws-modules/lambda/aws"
  version = "3.2.0"

  function_name = "${module.label.id}-delete_course"
  description   = "delete course"
  handler       = "index.handler"
  runtime       = "nodejs12.x"
  create_role   = false
  lambda_role   = var.delete_course_role_arn
  use_existing_cloudwatch_log_group = true
  cloudwatch_logs_retention_in_days = 3

  source_path = "${path.module}/lambda_source/delete_course/index.js"

 environment_variables = {
    TABLE_NAME = var.dynamo_db_deletecourse_name

  }
 
  tags = module.label.tags
}

resource "aws_cloudwatch_log_group" "get_all_authors" {
  name = format("/aws/lambda/%s", module.label_get_all_authors.id)
  retention_in_days = local.log_retention

  /*tags = merge(var.tags,
  {Function = format("%s", module.label_get_all_authors.id) }
 )*/
}


resource "aws_cloudwatch_log_group" "get_all_courses" {
  name = format("/aws/lambda/%s", module.label_get_all_courses.id)
  retention_in_days = local.log_retention

  /*tags = merge(var.tags,
  {Function = format("%s", module.label_get_all_courses.id) }
 )*/
}

resource "aws_cloudwatch_log_group" "get_course" {
  name = format("/aws/lambda/%s", "${module.label.id}-get_course")
  retention_in_days = local.log_retention

  /*tags = merge(var.tags,
  {Function = format("%s", "${module.label.id}-get_course")}
 )*/
}

resource "aws_cloudwatch_log_group" "save_course" {
  name = format("/aws/lambda/%s", "${module.label.id}-save_course")
  retention_in_days = local.log_retention

  /*tags = merge(var.tags,
  {Function = format("%s", "${module.label.id}-save_course")}
 )*/
}

resource "aws_cloudwatch_log_group" "update_course" {
  name = format("/aws/lambda/%s", "${module.label.id}-update_course")
  retention_in_days = local.log_retention

  /*tags = merge(var.tags,
  {Function = format("%s", "${module.label.id}-update_course")}
 )*/
}

resource "aws_cloudwatch_log_group" "delete_course" {
  name = format("/aws/lambda/%s", "${module.label.id}-delete_course")
  retention_in_days = local.log_retention

 /*tags = merge(var.tags,
  {Function = format("%s", "${module.label.id}-delete_course")}
 )*/
}















/*resource "aws_lambda_function" "get_all_authors" {
  
  filename = data.archive_file.get_all_authors.output_path
  function_name = "${module.labels.id}-get_all_authors"
  description   = "get all authors"
  role = var.role_get_all_authors_arn
  handler       = "get-all-authors.handler"
  
    runtime       = "nodejs12.x"

  source_path = "${path.module}/lambda_source/get_all_authors/index.js"

  tags = module.label.tags
}
*/


/*module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"
  version = "3.2.0"

  function_name = "my-lambda1"
  description   = "My awesome lambda function"
  handler       = "index.lambda_handler"
  runtime       = "python3.8"

  source_path = "../src/lambda-function1"

  tags = {
    Name = "my-lambda1"
  }
}
*/

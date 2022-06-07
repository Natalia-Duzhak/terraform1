module "lambda" {
   source  = "./modules/lambda"
   context = module.base_labels.context
   name    = "lambda"
   dynamo_db_authors_name = module.authors.id
   dynamo_db_courses_name = module.course.id
   dynamo_db_course_name = module.course.id
   dynamo_db_savecourse_name = module.course.id
   dynamo_db_updatecourse_name = module.course.id
   dynamo_db_deletecourse_name = module.course.id
   get_all_authors_role_arn = module.iam.get_all_authors_role_arn
   get_all_courses_role_arn = module.iam.get_all_courses_role_arn
   get_course_role_arn = module.iam.get_course_role_arn
   save_course_role_arn = module.iam.save_course_role_arn
   update_course_role_arn = module.iam.update_course_role_arn
   delete_course_role_arn = module.iam.delete_course_role_arn
 }



module "iam"{
 source = "./modules/iam"
 context = module.base_labels.context
 name = "iam"
dynamo_db_authors_arn = module.authors.arn
dynamo_db_courses_arn = module.course.arn
dynamo_db_course_arn = module.course.arn
dynamo_db_savecourse_arn = module.course.arn
dynamo_db_updatecourse_arn = module.course.arn
dynamo_db_deletecourse_arn = module.course.arn
cw_log_group_get_all_authors_arn = module.lambda.cw_log_group_get_all_authors_arn
cw_log_group_get_all_courses_arn = module.lambda.cw_log_group_get_all_courses_arn
cw_log_group_get_course_arn = module.lambda.cw_log_group_get_course_arn
cw_log_group_save_course_arn = module.lambda.cw_log_group_save_course_arn
cw_log_group_update_course_arn = module.lambda.cw_log_group_update_course_arn
cw_log_group_delete_course_arn = module.lambda.cw_log_group_delete_course_arn
}

module "frontend" {
  source                         = "./modules/s3-cloudfront-website"
  context                        = module.base_labels.context
  name                           = "frontend"
  domain_name                    = "dev.cf.lpnu.ua"
  website_cloudfront_min_ttl     = "300"
  website_cloudfront_default_ttl = "300"
  website_cloudfront_max_ttl     = "300"
}
/*
resource "aws_cloudwatch_log_group" "this" {
  name = format("/aws/lambda/%s", var.function_name)
  retention_in_days = var.log_retention

  tags = merge(var.tags,
  {Function = format("%s", var.function_name)}
 )
}
*/
















/*iYzZWOJb0QKbn1RAA4mmaTCD4dk3hKF7zkGjVnjb*/





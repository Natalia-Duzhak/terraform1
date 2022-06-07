variable "dynamo_db_authors_arn"{
type = string
}

variable "dynamo_db_courses_arn"{
type = string
}

variable "dynamo_db_course_arn"{
type = string
}

variable "dynamo_db_savecourse_arn"{
type = string
}

variable "dynamo_db_updatecourse_arn"{
type = string
}

variable "dynamo_db_deletecourse_arn"{
type = string
}





variable "cw_log_group_get_all_authors_arn" {
  type = string
}

variable "cw_log_group_get_all_courses_arn" {
  type = string
}

variable "cw_log_group_get_course_arn" {
  type = string
}

variable "cw_log_group_save_course_arn" {
  type = string
}

variable "cw_log_group_update_course_arn" {
  type = string
}

variable "cw_log_group_delete_course_arn" {
  type = string
}

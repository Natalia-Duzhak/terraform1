module "course"{
 source = "./modules/dynamodb"
 context = module.base_labels.context
 name = "course"
 hash_key         = "id"
 billing_mode     = "PAY_PER_REQUEST"
}

module "authors"{
 source = "./modules/dynamodb"
 context = module.base_labels.context
 name = "authors"
 hash_key         = "id"
 billing_mode     = "PAY_PER_REQUEST"
}

/*resource "aws_dynamodb_table" "this1" {
  name             = "this1"
  hash_key         = "TestTableHashKey"
  billing_mode     = "PAY_PER_REQUEST"


  attribute {
    name = "TestTableHashKey"
    type = "S"
  }
  depends_on = [
    aws_dynamodb_table.this2,
  ]
 }
 
 resource "aws_dynamodb_table" "this2" {
  name             = "this2"
  hash_key         = "TestTableHashKey"
  billing_mode     = "PAY_PER_REQUEST"


  attribute {
    name = "TestTableHashKey"
    type = "S"
  }
 }
 */

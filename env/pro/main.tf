data "aws_caller_identity" "current" {}

module "backup_frankfurt" {
  source                = "../../modules/backup"
  pro_account_id        = data.aws_caller_identity.current.id
  backup_account_id     = var.backup_account_id
  tag_project_name      = var.tag_project_name
  kms_key_name          = var.kms_key_name
  aws_db_instance_arn   = "arn:aws:db:eu-central-1:${var.pro_account_id}:/my-db-scenariofourth"
  aws_ebs_volume_arn    = "arn:aws:ebs:eu-central-1:${var.pro_account_id}:/cmy-ebs-scenariofourth"
}
module "backup_ireland" {
  source                = "../../modules/backup"
  pro_account_id        = data.aws_caller_identity.current.id
  backup_account_id     = var.backup_account_id
  tag_project_name      = var.tag_project_name
  kms_key_name          = var.kms_key_name
  aws_db_instance_arn   = "arn:aws:db:eu-west-2:${var.pro_account_id}:/my-db-scenariofourth"
  aws_ebs_volume_arn    = "arn:aws:ebs:eu-west-2:${var.pro_account_id}:/cmy-ebs-scenariofourth"
}
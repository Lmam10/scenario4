variable "tag_project_name" {
  type        = string
  description = "Tag project name"
}
variable "pro_account_id" {
  type        = string
  description = "AWS Pro Account ID"
}
variable "backup_account_id" {
  type        = string
  description = "AWS Backup Account ID"
}
variable "kms_key_name" {
  type        = string
  description = "KMS Key name"
}
variable "aws_db_instance_arn" {
  type        = string
  description = "AWS DB instance ARN"
}
variable "aws_ebs_volume_arn" {
  type        = string
  description = "AWS EBS volume ARN"
}



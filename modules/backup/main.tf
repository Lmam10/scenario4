resource "aws_backup_vault" "scenariofourth" {
  name         = "scenariofourth_backup_vault" 
  kms_key_arn  = "arn:aws:kms:us-east-1:${var.pro_account_id}:key/${var.kms_key_name}"
  tags = {
    Project = var.tag_project_name
  }
}

resource "aws_backup_vault_lock_configuration" "scenariofourth" {
  backup_vault_name = aws_backup_vault.scenariofourth.name
}

# Create Backup Plan
resource "aws_backup_plan" "scenariofourth" {
  name = "scenariofourth_backup_plan"

  rule {
    rule_name         = "daily-backup"
    target_vault_name = aws_backup_vault.scenariofourth.name
    schedule          = "cron(0 12 * * ? *)" # Daily

    lifecycle {
      cold_storage_after = 7
      delete_after       = 30
    }

    # Enable cross-region and cross-account backup copies via copy actions
    copy_action {
      destination_vault_arn = "arn:aws:backup:eu-central-1:${var.backup_account_id}:vault/crossRegionVault" 
      lifecycle {
        cold_storage_after = 7
        delete_after       = 90
      }
    }
  }
}

# Assign resources to Backup Plan
resource "aws_backup_selection" "scenariofourth" {
  name         = "scenariofourth_backup_selection"
  iam_role_arn = aws_iam_role.scenariofourth.arn
  plan_id      = aws_backup_plan.scenariofourth.id

  resources = [
    var.aws_db_instance_arn,
    var.aws_ebs_volume_arn,  
  ]
}
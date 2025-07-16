resource "azurerm_backup_policy_vm" "backupvmpolicy" {
  name                = var.azurerm_backup_policy_vm_name
  resource_group_name = var.resource_group_name
  recovery_vault_name = var.recovery_vault_name

  timezone = "UTC"
  tags     = var.tags

  backup {
    frequency = "Daily"
    time      = "23:00"
  }

  retention_daily {
    count = 10
  }

  retention_weekly {
    count    = 42
    weekdays = ["Sunday", "Wednesday", "Friday", "Saturday"]
  }

  retention_monthly {
    count    = 7
    weekdays = ["Sunday", "Wednesday"]
    weeks    = ["First", "Last"]
  }

  retention_yearly {
    count    = 77
    weekdays = ["Sunday"]
    weeks    = ["Last"]
    months   = ["January"]
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
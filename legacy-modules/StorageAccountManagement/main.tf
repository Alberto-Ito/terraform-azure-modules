data "azurerm_storage_account" "storage" {
  name                = var.azurerm_storage_account_name
  resource_group_name = var.storagergName
}

resource "azurerm_storage_management_policy" "example" {
  storage_account_id = data.azurerm_storage_account.storage.id

  rule {
    name    = var.rule1_name
    enabled = true
    filters {
      prefix_match = [var.prefix_match1]
      blob_types   = ["blockBlob"]
    }
    actions {
      base_blob {
        tier_to_cool_after_days_since_modification_greater_than    = 10
        tier_to_archive_after_days_since_modification_greater_than = 50
        delete_after_days_since_modification_greater_than          = 100
      }
      snapshot {
        delete_after_days_since_creation_greater_than = 30
      }
    }
  }
  rule {
    name    = var.rule2_name
    enabled = true
    filters {
      prefix_match = [var.prefix_match2]
      blob_types   = ["blockBlob"]
    }
    actions {
      base_blob {
        tier_to_cool_after_days_since_modification_greater_than    = 11
        tier_to_archive_after_days_since_modification_greater_than = 51
        delete_after_days_since_modification_greater_than          = 101
      }
      snapshot {
        delete_after_days_since_creation_greater_than = 31
      }
    }
  }
}
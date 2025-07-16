# Function App Slot

[Resource Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/function_app_slot)

**Notes:**
- Adding a slot in an existing Function with the Storage Account Firewall activated is not supported by Azure (known issue, no ETA). 
To be able to create the slot (and make the swap), the firewall must be deactivated.
# Azure Application Gateway Terraform Module Release Notes

## Version 1.1:
- Addition of `zones` argument to appgateway resource.
- Addition of variable defined as **zones** that has the default value of **null**.
- Overall addition of zone support/zone redundancy for the Application Gateway.

This module is used to manage/configure an Application Gateway based on the Terraform [azurerm_application_gateway documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_gateway)
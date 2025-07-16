# Private DNS Zone Data Module

locals {
  # Using 'flatten' to support string or array/list
  # Using 'toset' to remove duplicates, if any
  adx_locations = toset(flatten([var.adx_locations]))
}

# ADX
data "azurerm_private_dns_zone" "adx" {
  for_each            = local.adx_locations
  name                = "privatelink.${each.value}.kusto.windows.net"
  resource_group_name = var.resource_group_name
}

# APIM
data "azurerm_private_dns_zone" "apim" {
  name                = "azure-api.net"
  resource_group_name = var.resource_group_name
}

# App Configuration
data "azurerm_private_dns_zone" "azconfig" {
  name                = "privatelink.azconfig.io"
  resource_group_name = var.resource_group_name
}

# Azure Container Registry
data "azurerm_private_dns_zone" "azurecr" {
  name                = "privatelink.azurecr.io"
  resource_group_name = var.resource_group_name
}

# Functions and Apps
data "azurerm_private_dns_zone" "azurewebsites" {
  name                = "privatelink.azurewebsites.net"
  resource_group_name = var.resource_group_name
}

# Storage account (blob)
data "azurerm_private_dns_zone" "blob" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = var.resource_group_name
}

# Cosmos DB
data "azurerm_private_dns_zone" "documents" {
  name                = "privatelink.documents.azure.com"
  resource_group_name = var.resource_group_name
}

# Event Grid
data "azurerm_private_dns_zone" "eventgrid" {
  name                = "privatelink.eventgrid.azure.net"
  resource_group_name = var.resource_group_name
}

# Event Hub
data "azurerm_private_dns_zone" "eventhub" {
  name                = "privatelink.servicebus.windows.net"
  resource_group_name = var.resource_group_name
}

# Storage account (file)
data "azurerm_private_dns_zone" "file" {
  name                = "privatelink.file.core.windows.net"
  resource_group_name = var.resource_group_name
}

# Storage account (queue)
data "azurerm_private_dns_zone" "queue" {
  name                = "privatelink.queue.core.windows.net"
  resource_group_name = var.resource_group_name
}

# Redis Cache
data "azurerm_private_dns_zone" "redis" {
  name                = "privatelink.redis.cache.windows.net"
  resource_group_name = var.resource_group_name
}

# Service Bus
data "azurerm_private_dns_zone" "servicebus" {
  name                = "privatelink.servicebus.windows.net"
  resource_group_name = var.resource_group_name
}

# SignalR
data "azurerm_private_dns_zone" "signalr" {
  name                = "privatelink.service.signalr.net"
  resource_group_name = var.resource_group_name
}

# Storage account (table)
data "azurerm_private_dns_zone" "table" {
  name                = "privatelink.table.core.windows.net"
  resource_group_name = var.resource_group_name
}

# KeyVault
data "azurerm_private_dns_zone" "vaultcore" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = var.resource_group_name
}

# AMS
data "azurerm_private_dns_zone" "media" {
  name                = "privatelink.media.azure.net"
  resource_group_name = var.resource_group_name
}

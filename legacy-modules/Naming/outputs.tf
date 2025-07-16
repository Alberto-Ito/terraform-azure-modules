# General
# Add Subscription Name to RG
# rg-<Environment>-<business Unit>-<random string>

output "resource_group_name" {
  value = local.resource_group_name
}

# apim<Function>
output "api_management" {
  value = local.api_management
}

# Networking

# vnet-<Environment>-<random string>
output "virtual_network_name" {
  value = local.virtual_network_name
}

# snet-<Function>-<Environment>-<random string>

output "subnet_name" {
  value = local.subnet_name
}

# nic-<vm name>-<Environment>-<random string>

output "network_interface_name" {
  value = local.network_interface_name
}

# pip-<Environment>-<random string>

output "public_ip_address_name" {
  value = local.public_ip_address_name
}

# lbi-<app name or role><Environment><random string>

output "load_balancer_internal_name" {
  value = local.load_balancer_internal_name
}

# lbe-<app name or role><Environment><random string>

output "load_balancer_external_name" {
  value = local.load_balancer_external_name
}

# nsg-<policy name or app name>-<random string>

output "network_security_group_name" {
  value = local.network_security_group_name
}


# asg-<policy name or app name>-<random string>
# application_security_group_name = "${var.application_security_group}"
# lgw-<environment>-<random string>

output "local_network_gateway_name" {
  value = local.local_network_gateway_name
}


# vgw-<random string>

output "virtual_network_gateway_name" {
  value = local.virtual_network_gateway_name
}

# pe-<environment>-<random string>
output "private_endpoint_name" {
  value = local.private_endpoint_name
}

# cn-<local gateway name>-to-<virtual gateway name>

output "site_to_site_connection_name" {
  value = local.site_to_site_connection_name
}

# cn-<subscription1><region1>-to-<subscription2><region2>-

output "vpn_connection_name" {
  value = local.vpn_connection_name
}

# agw-<Environment>-<random string>
output "application_gateway_name" {
  value = local.application_gateway_name
}

# route-<route table name>-<Environment>-<random string>
output "route_table_name" {
  value = local.route_table_name
}


# traf-<Environment>-<random string>
output "traffic_manager_profile_name" {
  value = local.traffic_manager_profile_name
}

# ntw-<region>-<random string>

output "network_watcher" {
  value = local.network_watcher
}

# pls-<Environment><random string>
output "private_link_service" {
  value = local.private_link_service
}

output "front_door_name" {
  value = local.front_door_name
}

output "front_door_firewall_policy_name" {
  value = local.front_door_firewall_policy_name
}

output "bastion_name" {
  value = local.bastion_name
}

# Compute and Web

# vm-<Environment>-<random string>
output "virtual_machine_name" {
  value = local.virtual_machine_name
}

# stvm-<Environment>-<random string>

output "vm_storage_account_name" {
  value = local.vm_storage_account_name
}

# vmss-<Environment>-<random string>
output "virtual_machine_scale_set_name" {
  value = local.virtual_machine_scale_set_name
}

# avail-<Environment>-<random string>

output "availability_set_name" {
  value = local.availability_set_name
}

# arcm-<Environment>-<source location><random string>
output "azure_arc_connected_machine_name" {
  value = local.azure_arc_connected_machine_name
}

# aci-<Environment>-<random string>
output "container_instance_name" {
  value = local.container_instance_name
}

# acr-<Environment>-<random string>
output "container_registry_name" {
  value = local.container_registry_name
}


# aks-<Environment>-<random string>

output "aks_cluster_name" {
  value = local.aks_cluster_name
}

# aksnp-<Environment><random string>
output "aks_cluster_node_pool_name" {
  value = local.aks_cluster_node_pool_name
}


# sf-<Environment>-<random string>

output "service_fabric_cluster_name" {
  value = local.service_fabric_cluster_name
}

# ase-<Environment>-<random string>

output "app_service_environment_name" {
  value = local.app_service_environment_name
}

# asei-<Environment>-<random string>
output "app_service_environment_internal_name" {
  value = local.app_service_environment_internal_name
}

# plan-<App Size>-<Environment>-<random string>
output "app_service_plan_name" {
  value = local.app_service_plan_name
}

# app-<App Alias>-<Environment>-<random string>
output "web_app_name" {
  value = local.web_app_name
}

# func-<Function App Alias>-<Environment>-<random string>.
output "function_app_name" {
  value = local.function_app_name
}

# as-<App Alias>-<Environment>-<random string>.
output "app_service_name" {
  value = local.app_service_name
}

# appcs-<Environment>-<random string>
output "app_configuration_name" {
  value = local.app_configuration_name
}


# Data

# synw<synapse workspace name><Environment><random string>
output "synapse_workspace" {
  value = local.synapse_workspace
}

# synsqlp<synapse sql pool name><Environment><random string>
output "synapse_sql_pool" {
  value = local.synapse_sql_pool
}

# synspp<synapse spark pool name><Environment><random string>
output "synapse_spark_pool" {
  value = local.synapse_spark_pool
}

# synfw<Function><Environment><random string>
output "synapse_firewall_rule" {
  value = local.synapse_firewall_rule
}

# synmep<targetname><random string>
output "synapse_managed_private_endpoint" {
  value = local.synapse_managed_private_endpoint
}

# Databases

# sql<Function><Environment><random string>
output "sql_database_server" {
  value = local.sql_database_server
}

# sqldb<Function><Environment><random string>
output "sql_database" {
  value = local.sql_database
}

# cosmos<Function><Environment><random string>
output "cosmos_db_database" {
  value = local.cosmos_db_database
}

# redis<Function><Environment><random string>
output "redis_cache_instance" {
  value = local.redis_cache_instance
}

# redisfwr<Function><Environment><random string>
output "redis_firewall_rule" {
  value = local.redis_firewall_rule
}

# redisls<Function><Environment><random string>
output "redis_linked_server" {
  value = local.redis_linked_server
}

# mysqls<Function><Environment><random string>
output "mysql_server_name" {
  value = local.mysql_server
}

# mysql<Function><Environment><random string>
output "mysql_database_name" {
  value = local.mysql_database
}

# psql<Function><Environment><random string>
output "postgresql_database" {
  value = local.postgresql_database
}

# sqldw<Function><Environment><random string>
output "sql_data_warehouse" {
  value = local.sql_data_warehouse
}

# Diagnostic logs 

# diag-<Linked resource name> [ -<setting intent> ]
output "diagnostic_logs_name" {
  value = local.diagnostic_logs_name
}

# Analytics and IoT

# dbw<databricks workspace name><Environment><random string>
output "azure_databricks_workspace" {
  value = local.azure_databricks_workspace
}


# df<Environment><random string>
output "data_factory" {
  value = local.data_factory
}

# dflssqldb<Environment><random string>
output "data_factory_linked_service_sql_database" {
  value = local.data_factory_linked_service_sql_database
}

# dflsdlg2<Environment><random string>
output "data_factory_linked_service_data_lake_gen2" {
  value = local.data_factory_linked_service_data_lake_gen2
}

# dflskv<Environment><random string>
output "data_factory_linked_service_keyvault" {
  value = local.data_factory_linked_service_keyvault
}

# evh<Environment><random string>
output "event_hub" {
  value = local.event_hub
}

# evhn<Environment><#random string>
output "event_hub_namespace" {
  value = local.event_hub_namespace
}

# evcg-<eventHubName>-adx
output "event_hub_consumer_group" {
  value = local.event_hub_consumer_group
}

# event grid
output "event_grid_name" {
  value = local.event_grid_name
}

# egt-<Environment>-<random string>
output "event_grid_topic" {
  value = local.event_grid_topic
}

# egsub-<Environment>-<random string>
output "event_grid_subscription" {
  value = local.event_grid_subscription
}

# servicebus
output "service_bus_namespace_name" {
  value = local.service_bus_namespace_name
}

# servicebus queue
output "service_bus_queue" {
  value = local.service_bus_queue
}

# Storage

# st<storage name><Environment><random string>
output "storage_account_name" {
  value = local.storage_account_name
}

# stdiag<Environment><random string>
output "diagnostic_logs_storage_account_name" {
  value = local.diagnostic_logs_storage_account_name
}

# dls<Environment><random string>
output "data_lake_store_account" {
  value = local.data_lake_store_account
}


# Security

# ddos-<Environment>-<random string>
output "network_ddos_protection_plan" {
  value = local.network_ddos_protection_plan
}

# Management and governance

# kv-<Environment>-<random string>
output "key_vault" {
  value = local.key_vault
}

# log-<Environment><random string>
output "log_analytics_workspace" {
  value = local.log_analytics_workspace
}

# aapi-<Environment>-<random string>
output "application_insights" {
  value = local.application_insights
}

# rsv-<region>-<random string>
output "recovery_services_vault" {
  value = local.recovery_services_vault
}

# sig-<Environment>-<random string>
output "shared_image_gallery" {
  value = local.shared_image_gallery
}

# Tags
output "tags" {
  value = local.tags
}

# des-<Environment>-<target>-<random string>
output "disk_encryption_set" {
  value = local.disk_encryption_set
}

# Azure Data Explorer
output "azure_data_explorer" {
  value = local.azure_data_explorer
}

# Azure SignalR
output "azure_signalr" {
  value = local.azure_signalr
}
output "analysis_service_server_name" {
  value = local.analysis_service_server_name
}

output "azure_media_services_account" {
  value = local.azure_media_services_account
}


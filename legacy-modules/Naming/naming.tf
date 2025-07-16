variable "quantity" {
  default = 1
}
variable "resource_group" {
  default = "rg"
}

# Tags

variable "owner" {
  default = "__owner__"
}

variable "environment" {
  default = "__environment__"
  # Examples
  #   production       = "p"
  #   development      = "d"
  #   quality assurance = "q"
  #   stagging         = "s"
  #   testing          = "t"
  #   sandbox          = "sand"
  #   sharedservices   = "ss"
}

variable "business_unit" {
  default = "__business_unit__"
  # Department Examples
  #   finance   = "fin"
  #   marketing = "mktg"
  #   product   = "pdt"
  #   it        = "it"
  #   security  = "sec"
}

variable "project_name" {
  default = "__project_name__"
}

variable "contact_name" {
  default = "__contact_name__"
}

variable "contact_email" {
  default = "__contact_email__"
}

variable "managed_by_vendor" {
  default = "__managed_by_vendor__"
}

variable "cost_center" {
  default = "__cost_center__"
}

variable "requestor" {
  default = "__requestor__"
}

variable "service_class" {
  default = "__service_class__"
}

variable "league" {
  default = "__league__"
}

# General

variable "policy_definition" {
  default = "policy"
}

variable "waf_policy" {
  default = "wafpolicy"
}

variable "location" {
  default = "eastus2"
}

variable "api_management" {
  default = "apim"
}

variable "azure_signalr" {
  default = "signalr"
}

variable "azure_media_services_account" {
  default = "ams"
}

# Networking
variable "virtual_network" {
  default = "vnet"
}
variable "virtual_network_peering" {
  default = "vnetp"
}
variable "subnet" {
  default = "snet"
}
variable "network_interface" {
  default = "nic"
}
variable "public_ip_address" {
  default = "pip"
}
variable "load_balancer_internal" {
  default = "lbi"
}
variable "load_balancer_external" {
  default = "lbe"
}
variable "network_security_group" {
  default = "nsg"
}
variable "private_endpoint" {
  default = "pe"
}
variable "network_security_group_alias" {
  default = "dbw1"
}
variable "private_link_service" {
  default = "pls"
}
variable "application_security_group" {
  default = "asg"
}
variable "local_network_gateway" {
  default = "lgw"
}
variable "virtual_network_gateway" {
  default = "vgw"
}
variable "source_vpn_name" {
  default = "sourcevpnname"
}
variable "target_vpn_name" {
  default = "targetvpnname"
}
variable "vpn_connection" {
  default = "cn"
}
variable "application_gateway" {
  default = "agw"
}
variable "route_table" {
  default = "route"
}
variable "traffic_manager_profile" {
  default = "traf"
}
variable "network_watcher" {
  default = "ntw"
}
variable "front_door" {
  default = "fd"
}
variable "bastion_name" {
  default = "bas"
}
variable "azure_data_explorer" {
  default = "adx"
}

# Compute and Web
variable "virtual_machine" {
  default = "vm"
}
variable "vm_name" {
  default = "vmhostname"
}
variable "virtual_machine_scale_set" {
  default = "vmss"
}
variable "availability_set" {
  default = "avail"
}
variable "vm_storage_account" {
  default = "stvm"
}
variable "source_location" {
  default = "sourcelocation"
  # Example
  # AWS
  # On Premise (This can be more specific such as unique data center name or alias.)
  # K8sOmahaDC1
}
variable "azure_arc_connected_machine" {
  default = "arcm"
}
variable "container_instance" {
  default = "aci"
}
variable "container_registry" {
  default = "acr"
}
variable "aks_cluster" {
  default = "aks"
}
# aks-node-cluster must be 12 char alpha num only!!
variable "aks_cluster_node_pool" {
  default = "aksnp"
}
variable "service_fabric_cluster" {
  default = "sf"
}
variable "app_service_environment" {
  default = "ase"
}
variable "app_service_environment_internal" {
  default = "asei"
}
variable "app_service_plan" {
  default = "plan"
}
variable "app_sku_size" {
  default = "S1"
}
variable "web_app" {
  default = "app"
}
variable "event_grid" {
  default = "eg"
}
variable "service_bus" {
  default = "sb"
}
variable "app_alias" {
  default = "myappalias"
}
variable "function_app" {
  default = "func"
}
variable "function_app_alias" {
  default = "myfunctionappalias"
}
variable "app_service" {
  default = "app"
}
variable "app_service_alias" {
  default = "as"
}
variable "app_configuration" {
  default = "appcs"
}

# Not added to local for naming.
################################################################################

variable "cloud_service" {
  default = "cld"
}
variable "notification_hubs" {
  default = "ntf"
}
variable "notification_hubs_namespace" {
  default = "ntfns"
}

################################################################################

# Databases

variable "azure_sql_database_server" {
  default = "sql"
}
variable "azure_sql_database" {
  default = "sqldb"
}
variable "azure_cosmos_db_database" {
  default = "cosmos"
}
variable "azure_redis_cache_instance" {
  default = "redis"
}
variable "azure_redis_firewall_rule" {
  default = "redisfwr"
}
variable "azure_redis_linked_server" {
  default = "redisls"
}
variable "mysql_server" {
  default = "mysqls"
}
variable "mysql_database" {
  default = "mysql"
}
variable "postgresql_database" {
  default = "psql"
}
variable "azure_sql_data_warehouse" {
  default = "sqldw"
}

#OLD azure_synapse_analytics

variable "azure_synapse_analytics" {
  default = "syn"
}

variable "azurerm_synapse_workspace" {
  default = "synw"
}
variable "azurerm_synapse_sql_pool" {
  default = "synsqlp"
}
variable "azurerm_synapse_spark_pool" {
  default = "synspp"
}
variable "azurerm_synapse_firewall_rule" {
  default = "synfw"
}
variable "azurerm_synapse_managed_private_endpoint" {
  default = "synmpe"
}
variable "sql_server_stretch_database" {
  default = "sqlstrdb"
}

# Diagnostic logs

variable "diagnostic_logs" {
  default = "diag-"
}

# Storage

variable "storage_account" {
  default = "st"
}
variable "diagnostic_logs_storage_account_name" {
  default = "stdiag"
}
variable "azure_storsimple" {
  default = "ssimp"
}

# AI and Machine Learning

variable "azure_cognitive_search" {
  default = "srch"
}
variable "azure_cognitive_services" {
  default = "cog"
}
variable "azure_machine_learning_workspace" {
  default = "mlw"
}

# Analytics and IoT

variable "azure_analysis_services_server" {
  default = "as"
}
variable "azure_databricks_workspace" {
  default = "dbw"
}
variable "azure_stream_analytics" {
  default = "asa"
}
variable "data_factory" {
  default = "df"
}
variable "data_factory_linked_service_sql_database" {
  default = "lssqldb"
}
variable "data_factory_linked_service_data_lake_gen2" {
  default = "lsdlg2"
}
variable "data_factory_linked_service_keyvault" {
  default = "lskv"
}
variable "data_lake_store_account" {
  default = "dls"
}
variable "data_lake_analytics_account" {
  default = "dla"
}
variable "event_hub" {
  default = "evh"
}
variable "event_hub_namespace" {
  default = "evhn"
}
variable "event_hub_consumer_group" {
  default = "evcg"
}
variable "event_grid_topic" {
  default = "egt"
}
variable "event_grid_subscription" {
  default = "egsub"
}
variable "hdinsight_hadoop_cluster" {
  default = "hadoop"
}
variable "hdinsight_hbase_cluster" {
  default = "hbase"
}
variable "hdinsight_kafka_cluster" {
  default = "kafka"
}
variable "hdinsight_spark_cluster" {
  default = "spark"
}
variable "hdinsight_storm_cluster" {
  default = "storm"
}
variable "hdinsight_ml_services_cluster" {
  default = "mls"
}
variable "iot_hub" {
  default = "iot"
}
variable "power_bi_embedded" {
  default = "pbi"
}

# Integration
variable "logic_apps" {
  default = "logic"
}
variable "service_bus_queue" {
  default = "sbq"
}
variable "service_bus_topic" {
  default = "sbt"
}
variable "service_bus_subscription" {
  default = "sbs"
}
# Management and governance
variable "blueprint" {
  default = "bp"
}
variable "key_vault" {
  default = "kv"
}
variable "log_analytics_workspace" {
  default = "log"
}
variable "application_insights" {
  default = "appi"
}
variable "recovery_services_vault" {
  default = "rsv"
}
# Migration
variable "azure_migrate_project" {
  default = "migr"
}
variable "database_migration_service_instance" {
  default = "dms"
}

# Security

variable "network_ddos_protection_plan" {
  default = "ddos"
}

variable "shared_image_gallery" {
  default = "sig"
}

# Encryption

variable "disk_encryption_set" {
  default = "des"
}


################################
############        ############
############ Locals ############
############        ############
################################

locals {

  # General
  # Add Subscription Name to RG


  # rg-<Environment>-<business Unit>-<random string>
  resource_group_name = "${var.resource_group}-${var.environment}-${var.business_unit}"

  # apim<Function>
  api_management = var.api_management

  # Networking

  # vnet-<Environment>-<random string>
  virtual_network_name = "${var.virtual_network}-${var.environment}"

  # snet-<Environment>-<random string>
  subnet_name = "${var.subnet}-${var.environment}"

  # nic-<vm name>-<Environment>-<random string>
  network_interface_name = "${var.network_interface}-${var.vm_name}-${var.environment}"

  # pip-<vm name or app name>-<Environment>-<random string>
  public_ip_address_name = "${var.public_ip_address}-${var.environment}"

  # lbi-<app name or role><Environment><random string>
  load_balancer_internal_name = "${var.load_balancer_internal}-${var.environment}"

  # lbe-<app name or role><Environment><random string>
  load_balancer_external_name = "${var.load_balancer_external}-${var.environment}"

  # nsg-<policy name or app name>-<random string>
  network_security_group_name = "${var.network_security_group}-${var.network_security_group_alias}"

  # pe-<environment>-<random string>
  private_endpoint_name = "${var.private_endpoint}-${var.environment}"

  # asg-<policy name or app name>-<random string>
  # application_security_group_name = "${var.application_security_group}"
  # lgw-<environment>-<random string>
  local_network_gateway_name = "${var.local_network_gateway}-${var.environment}"

  # vgw-<random string>
  virtual_network_gateway_name = var.virtual_network_gateway


  # cn-<local gateway name>-to-<virtual gateway name>
  site_to_site_connection_name = "${var.vpn_connection}-${var.local_network_gateway}-${var.virtual_network_gateway}"

  # cn-<subscription1><region1>-to-<subscription2><region2>-
  vpn_connection_name = "${var.vpn_connection}-${var.source_vpn_name}-${var.target_vpn_name}"

  # agw-<Environment>-<random string>
  application_gateway_name = "${var.application_gateway}-${var.environment}"

  # route-<route table name>-<Environment>-<random string>
  route_table_name = "${var.route_table}-${var.environment}"

  # traf-<Environment>-<random string>
  traffic_manager_profile_name = "${var.traffic_manager_profile}-${var.environment}"

  # ntw-<Environment>-<random string>
  network_watcher = "${var.network_watcher}-${var.environment}"

  # pls-<Environment><random string>
  private_link_service = "${var.private_link_service}-${var.environment}"

  # fd-<Environment>-<random string>
  front_door_name = "${var.front_door}-${var.environment}"

  # <frontDoorName><policy><Environment><random string>
  front_door_firewall_policy_name = var.waf_policy

  #bas-<Environment>-<random string>
  bastion_name = "${var.bastion_name}-${var.environment}"

  # Compute and Web

  # vm-<Environment>-<random string>
  virtual_machine_name = "${var.virtual_machine}-${var.environment}"

  # stvm-<Environment>-<random string>
  vm_storage_account_name = "${var.vm_storage_account}-${var.environment}"

  # vmss-<Environment>-<random string>
  virtual_machine_scale_set_name = "${var.virtual_machine_scale_set}-${var.environment}"

  # avail-<Environment>-<random string>
  availability_set_name = "${var.availability_set}-${var.environment}"

  # arcm-<Environment>-<source location><random string>
  azure_arc_connected_machine_name = "${var.azure_arc_connected_machine}-${var.environment}-${var.source_location}"

  # aci-<Environment>-<random string>
  container_instance_name = "${var.container_instance}-${var.environment}"

  # # acr-<Environment>-<random string>
  container_registry_name = "${var.container_registry}${var.environment}"


  # aks-<Environment>-<random string>
  aks_cluster_name = "${var.aks_cluster}-${var.environment}"

  # aksnp-<Environment><random string>
  aks_cluster_node_pool_name = "${var.aks_cluster_node_pool}${var.environment}"


  # sf-<Environment>-<random string>
  service_fabric_cluster_name = "${var.service_fabric_cluster}-${var.environment}"

  # ase-<Environment>-<random string>
  app_service_environment_name = "${var.app_service_environment}-${var.environment}"

  # asei-<Environment>-<random string>
  app_service_environment_internal_name = "${var.app_service_environment_internal}-${var.environment}"

  # plan-<App Size>-<Environment>-<random string>
  app_service_plan_name = "${var.app_service_plan}-${var.app_sku_size}-${var.environment}"

  # app-<App Alias>-<Environment>-<random string>
  web_app_name = "${var.web_app}-${var.app_alias}-${var.environment}"

  # eg-<App Alias>-<Environment>-<random string>
  event_grid_name = "${var.event_grid}-${var.app_alias}-${var.environment}"

  # sb-<App Alias>-<Environment>-<random string>
  service_bus_namespace_name = "${var.service_bus}-${var.app_alias}-${var.environment}"

  #service bus queue
  service_bus_queue = var.service_bus_queue

  # func-<Function App Alias>-<Environment>-<random string>.
  function_app_name = "${var.function_app}-${var.function_app_alias}-${var.environment}"

  # func-<App Service Alias>-<Environment>-<random string>.
  app_service_name = "${var.app_service}-${var.app_service_alias}-${var.environment}"

  # appcs-<Environment>-<random string>
  app_configuration_name = "${var.app_configuration}-${var.environment}"

  # Data

  # synw<synapse workspace name><Environment><random string>
  synapse_workspace = "${var.azurerm_synapse_workspace}${var.environment}"

  # synsqlp<synapse sql pool name><Environment><random string>
  synapse_sql_pool = "${var.azurerm_synapse_sql_pool}${var.environment}"

  # synspp<synapse spark pool name><Environment><random string>
  synapse_spark_pool = "${var.azurerm_synapse_spark_pool}${var.environment}"

  # synfw<Function><Environment><random string>
  synapse_firewall_rule = "${var.azurerm_synapse_firewall_rule}${var.environment}"

  # synmep<targetname><random string>
  synapse_managed_private_endpoint = var.azurerm_synapse_managed_private_endpoint


  # Databases

  # sql<Function><Environment><random string>
  sql_database_server = "${var.azure_sql_database_server}${var.environment}"

  # sqldb<Function><Environment><random string>
  sql_database = "${var.azure_sql_database}${var.environment}"

  # cosmos<Function><Environment><random string>
  cosmos_db_database = "${var.azure_cosmos_db_database}${var.environment}"

  # redis<Function><Environment><random string>
  redis_cache_instance = "${var.azure_redis_cache_instance}${var.environment}"

  # redisfwr<Function><Environment><random string>
  redis_firewall_rule = "${var.azure_redis_firewall_rule}${var.environment}"

  # redisls<Function><Environment><random string>
  redis_linked_server = "${var.azure_redis_linked_server}${var.environment}"

  # mysqls<Function><Environment><random string>
  mysql_server = "${var.mysql_server}${var.environment}"

  # mysql<Function><Environment><random string>
  mysql_database = "${var.mysql_database}${var.environment}"

  # psql<Function><Environment><random string>
  postgresql_database = "${var.postgresql_database}${var.environment}"

  # sqldw<Function><Environment><random string>
  sql_data_warehouse = "${var.azure_sql_data_warehouse}${var.environment}"


  # Analytics and IoT

  # dbw<databricks workspace name><Environment><random string>
  azure_databricks_workspace = "${var.azure_databricks_workspace}${var.environment}"

  # evh<Environment><random string>
  event_hub = "${var.event_hub}${var.environment}"

  # evhn<Environment><random string>
  event_hub_namespace = "${var.event_hub_namespace}${var.environment}"

  # evcg-<eventHubName>-adx
  event_hub_consumer_group = "${var.event_hub_consumer_group}"

  # egt-<Environment>-<random string>
  event_grid_topic = "${var.event_grid_topic}-${var.environment}"

  # egsub-<Environment>-<random string>
  event_grid_subscription = "${var.event_grid_subscription}-${var.environment}"

  # sb-<Environment><random string>
  service_bus = "${var.service_bus}-${var.environment}"

  # df<Environment><random string>
  data_factory = "${var.data_factory}${var.environment}"

  # dflssqldb<Environment><random string>
  data_factory_linked_service_sql_database = "${var.data_factory}${var.data_factory_linked_service_sql_database}${var.environment}"

  # dflsdlg2<Environment><random string>
  data_factory_linked_service_data_lake_gen2 = "${var.data_factory}${var.data_factory_linked_service_data_lake_gen2}${var.environment}"

  # dflskv<Environment><random string>
  data_factory_linked_service_keyvault = "${var.data_factory}${var.data_factory_linked_service_keyvault}${var.environment}"

  # Diagnostic logs

  # diag-<Linked resource name> [ -<setting intent> ]
  diagnostic_logs_name = var.diagnostic_logs

  # Storage

  # st<storage name><Environment><random string>
  storage_account_name = "${var.storage_account}${var.environment}"

  # stdiag<Environment><random string>
  diagnostic_logs_storage_account_name = "${var.diagnostic_logs_storage_account_name}${var.environment}"

  # dls<Environment><random string>
  data_lake_store_account = "${var.data_lake_store_account}${var.environment}"


  # Security

  # ddos-<Environment>-<random string>
  network_ddos_protection_plan = "${var.network_ddos_protection_plan}-${var.environment}"

  # Management and governance

  # kv-<Environment>-<random string>
  key_vault = "${var.key_vault}-${var.environment}"

  # log-<Environment><random string>
  log_analytics_workspace = "${var.log_analytics_workspace}-${var.environment}"

  # aapi-<Environment>-<random string>
  application_insights = "${var.application_insights}-${var.environment}"

  # rsv-<region>-<random string>
  recovery_services_vault = "${var.recovery_services_vault}-${var.location}"

  # sig-<Environment>-<random string>
  shared_image_gallery = "${var.shared_image_gallery}${var.location}"

  # Encryption

  # des-<Environment>-<target>-<random string>
  disk_encryption_set = "${var.disk_encryption_set}-${var.environment}"

  # Azure Data Explorer
  azure_data_explorer = "${var.azure_data_explorer}"

  # Azure SignalR
  azure_signalr = "${var.azure_signalr}-${var.environment}"
  # Analysis Service: as<environment><random string>
  analysis_service_server_name = "${var.azure_analysis_services_server}${var.environment}"

  # Azure Media Services account
  azure_media_services_account = "${var.azure_media_services_account}${var.environment}"

  # Tags

  tags = {
    OwnerName       = "${var.owner}"
    Department      = "${var.business_unit}"
    Project         = "${var.project_name}"
    Environment     = "${var.environment}"
    ContactName     = "${var.contact_name}"
    ContactEmail    = "${var.contact_email}"
    ManagedByVendor = "${var.managed_by_vendor}"
    CostCenter      = "${var.cost_center}"
    Requestor       = "${var.requestor}"
    ServiceClass    = "${var.service_class}"
    League          = "${var.league}"
  }

}

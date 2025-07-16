data "azurerm_subscriptions" "available" {
}

locals {
  nba_shared_001    = "NBA-SharedServices-0001"
  nba_sandbox_001   = "NBA-Sandbox-001"
  nba_dev_001       = "NBA-Dev-001"
  nba_prod_001      = "NBA-Prod-001"
  nba_network_001   = "NBA-Network-001"
  mediakind_dev_001 = "MediaKind-Dev-001"
  mediakind_dev_002 = "MediaKind-Dev-002"
  mediakind_dev_003 = "MediaKind-Dev-003"
  ott_shared_001    = "OTT-SharedServices-0001"
  ott_sandbox_001   = "OTT Sandbox"
  ott_dev_001       = "OTT-Dev-001"
  ott_qa_001        = "OTT-QA-001"
}

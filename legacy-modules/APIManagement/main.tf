resource "azurerm_api_management" "apim0" {
  name                = var.azurerm_api_management_name
  location            = var.location
  resource_group_name = var.resource_group_name
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email
  sku_name            = var.sku_name
  tags                = var.tags

  identity {
    type = "SystemAssigned"
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }

  security {
    enable_backend_ssl30  = var.enable_backend_ssl30
    enable_backend_tls10  = var.enable_backend_tls10
    enable_backend_tls11  = var.enable_backend_tls11
    enable_frontend_ssl30 = var.enable_frontend_ssl30
    enable_frontend_tls10 = var.enable_frontend_tls10
    enable_frontend_tls11 = var.enable_frontend_tls11

    tls_ecdhe_ecdsa_with_aes256_cbc_sha_ciphers_enabled = var.tls_ecdhe_ecdsa_with_aes256_cbc_sha_ciphers_enabled
    tls_ecdhe_ecdsa_with_aes128_cbc_sha_ciphers_enabled = var.tls_ecdhe_ecdsa_with_aes128_cbc_sha_ciphers_enabled
    tls_ecdhe_rsa_with_aes256_cbc_sha_ciphers_enabled   = var.tls_ecdheRsa_with_aes256_cbc_sha_ciphers_enabled
    tls_ecdhe_rsa_with_aes128_cbc_sha_ciphers_enabled   = var.tls_ecdheRsa_with_aes128_cbc_sha_ciphers_enabled
    tls_rsa_with_aes128_gcm_sha256_ciphers_enabled      = var.tls_rsa_with_aes128_gcm_sha256_ciphers_enabled
    tls_rsa_with_aes256_cbc_sha256_ciphers_enabled      = var.tls_rsa_with_aes256_cbc_sha256_ciphers_enabled
    tls_rsa_with_aes128_cbc_sha256_ciphers_enabled      = var.tls_rsa_with_aes128_cbc_sha256_ciphers_enabled
    tls_rsa_with_aes256_cbc_sha_ciphers_enabled         = var.tls_rsa_with_aes256_cbc_sha_ciphers_enabled
    tls_rsa_with_aes128_cbc_sha_ciphers_enabled         = var.tls_rsa_with_aes128_cbc_sha_ciphers_enabled
    triple_des_ciphers_enabled                          = var.triple_des_ciphers_enabled
  }
}

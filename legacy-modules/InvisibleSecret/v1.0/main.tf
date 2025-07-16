data "azurerm_client_config" "current" {
}

data "azurerm_subscription" "primary" {
}

data "azurerm_key_vault" "keyvault" {
  name                = "sandkeys"
  resource_group_name = "P1"
}


data "azurerm_key_vault_secret" "spnapi" {
  name         = "appid"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

output "apiid_secret" {
  value = data.azurerm_key_vault_secret.spnapi.value
}

data "azurerm_key_vault_secret" "spnsecret" {
  name         = "appidsecret"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

output "api_secret" {
  value = data.azurerm_key_vault_secret.spnsecret.value
}


resource "null_resource" "invisiblesecret" {
  provisioner "local-exec" {
    command = <<EOT

if (Get-Module -ListAvailable -Name Az) {
    Write-Host "Module exists"
}
else {
    Write-Host "Module does not exist, installing now."
    Install-Module -Name Az -AllowClobber -scope CurrentUser -Confirm:$false -Force
}

Import-Module az

$securesecret = ConvertTo-SecureString -String ${data.azurerm_key_vault_secret.spnsecret.value} -AsPlainText -Force
$Credential = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList ${data.azurerm_key_vault_secret.spnapi.value},$securesecret
Login-AzAccount -Credential $Credential -Tenant ${data.azurerm_client_config.current.tenant_id} -ServicePrincipal
Select-AzSubscription ${data.azurerm_client_config.current.subscription_id}

Update-AzKeyVaultNetworkRuleSet -VaultName ${var.keyvault_name} -DefaultAction Allow


      Function Generate-InvisibleSecret {
$letters = -join ((65..90) + (97..122) | Get-Random -Count 3 | % { [char]$_ })
$letters2 = -join ((65..90) + (97..122) | Get-Random -Count 3 | % { [char]$_ })
$letters3 = -join ((65..90) + (97..122) | Get-Random -Count 3 | % { [char]$_ })
$numbers = Get-Random -Maximum 99
$special = '$', '%', '~', '-', '+', '`' | Get-Random -Count 1
$special2 = '$', '%', '~', '-', '+', '`' | Get-Random -Count 1
$special3 = '$', '%', '~', '-', '+', '`' | Get-Random -Count 1

$password0 = -join $letters + $special3 + $letters2 + $numbers + $letters3 + $special + $letters2
$password1 = -join $numbers + $special + $letters + $special2 + $letters2 + $special3 + $letters3
$password2 = -join $special3 + $letters3 + $numbers + $special + $letters + $special2 + $letters2
$password3 = -join $special + $letters + $numbers + $special3 + $letters2 + $numbers + $letters3
$password4 = -join $special2 + $letters +$special3 + $numbers + $letters2 + $special + $letters3

$PasswordSelection0 = $password0, $password1, $password2, $password3, $password4 | Get-random
$PasswordSelection0
}

$InvisibleSecret = Generate-InvisibleSecret

$LoadSecret = ConvertTo-SecureString -String $InvisibleSecret -AsPlainText -Force
$LoadSecretUserName = ConvertTo-SecureString -String ${var.secret_user_name} -AsPlainText -Force

Set-AzKeyVaultSecret -VaultName ${var.keyvault_name} -Name ${var.secret_user_name} -SecretValue $LoadSecretUserName

Set-AzKeyVaultSecret -VaultName ${var.keyvault_name} -Name ${var.secret_password_name} -SecretValue $LoadSecret

Update-AzKeyVaultNetworkRuleSet -VaultName ${var.keyvault_name} -DefaultAction Deny
  EOT

    interpreter = ["Powershell", "-Command"]
  }
}


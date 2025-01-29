#---------------
# Linux Web App
#---------------
output "name" {
  description = "The Name of the Linux Web App."
  value       = azurerm_linux_web_app.linux_web_app.name
}

output "id" {
  description = "The ID of the Linux Web App."
  value       = azurerm_linux_web_app.linux_web_app.id
}

output "custom_domain_verification_id" {
  description = "The identifier used by App Service to perform domain ownership verification via DNS TXT record."
  value       = azurerm_linux_web_app.linux_web_app.custom_domain_verification_id
}

output "hosting_environment_id" {
  description = "The ID of the App Service Environment used by App Service."
  value       = azurerm_linux_web_app.linux_web_app.hosting_environment_id
}

output "default_hostname" {
  description = "The default hostname of the Linux Web App."
  value       = azurerm_linux_web_app.linux_web_app.default_hostname
}

output "kind" {
  description = "The Kind value for this Linux Web App."
  value       = azurerm_linux_web_app.linux_web_app.kind
}

output "outbound_ip_address_list" {
  description = "A list of outbound IP addresses - such as ['52.23.25.3', '52.143.43.12']"
  value       = azurerm_linux_web_app.linux_web_app.outbound_ip_address_list
}

output "outbound_ip_addresses" {
  description = "A comma separated list of outbound IP addresses - such as 52.23.25.3,52.143.43.12."
  value       = azurerm_linux_web_app.linux_web_app.outbound_ip_addresses
}

output "possible_outbound_ip_address_list" {
  description = "A list of possible outbound ip address."
  value       = azurerm_linux_web_app.linux_web_app.possible_outbound_ip_address_list
}

output "possible_outbound_ip_addresses" {
  description = "A comma-separated list of outbound IP addresses - such as 52.23.25.3,52.143.43.12,52.143.43.17 - not all of which are necessarily in use. Superset of outbound_ip_addresses."
  value       = azurerm_linux_web_app.linux_web_app.possible_outbound_ip_addresses
}

output "site_credential" {
  description = "A site_credential block as defined below."
  value       = azurerm_linux_web_app.linux_web_app.site_credential
}

output "identity" {
  description = "An identity block"
  value       = azurerm_linux_web_app.linux_web_app.identity
}
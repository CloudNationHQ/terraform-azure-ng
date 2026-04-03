output "config" {
  description = "contains all nat gateway configuration"
  value       = azurerm_nat_gateway.gw
}

output "subnet_associations" {
  description = "contains all subnet nat gateway associations"
  value       = azurerm_subnet_nat_gateway_association.gw_as
}

output "public_ip_associations" {
  description = "contains all public ip nat gateway associations"
  value       = azurerm_nat_gateway_public_ip_association.pip_as
}

output "public_ip_prefix_associations" {
  description = "contains all public ip prefix nat gateway associations"
  value       = azurerm_nat_gateway_public_ip_prefix_association.pippf_as
}

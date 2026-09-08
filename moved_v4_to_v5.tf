moved {
  from = azurerm_nat_gateway.gw
  to   = azurerm_nat_gateway.this
}

moved {
  from = azurerm_subnet_nat_gateway_association.gw_as
  to   = azurerm_subnet_nat_gateway_association.this
}

moved {
  from = azurerm_nat_gateway_public_ip_association.pip_as
  to   = azurerm_nat_gateway_public_ip_association.this
}

moved {
  from = azurerm_nat_gateway_public_ip_prefix_association.pippf_as
  to   = azurerm_nat_gateway_public_ip_prefix_association.this
}

# nat gateway
resource "azurerm_nat_gateway" "gw" {
  resource_group_name = coalesce(
    lookup(
      var.config, "resource_group_name", null
    ), var.resource_group_name
  )

  location = coalesce(
    lookup(var.config, "location", null
    ), var.location
  )

  name                    = var.config.name
  sku_name                = var.config.sku_name
  idle_timeout_in_minutes = var.config.idle_timeout_in_minutes
  zones                   = var.config.zones

  tags = coalesce(
    var.config.tags, var.tags
  )
}

# subnet association
resource "azurerm_subnet_nat_gateway_association" "gw_as" {
  subnet_id      = var.config.subnet_id
  nat_gateway_id = azurerm_nat_gateway.gw.id
}

# public ip association
resource "azurerm_nat_gateway_public_ip_association" "pip_as" {
  for_each = lookup(
    var.config, "public_ip_associations", {}
  )

  nat_gateway_id       = azurerm_nat_gateway.gw.id
  public_ip_address_id = each.value.public_ip_address_id
}

# public ip prefix association
resource "azurerm_nat_gateway_public_ip_prefix_association" "pippf_as" {
  for_each = lookup(
    var.config, "public_ip_prefix_associations", {}
  )

  nat_gateway_id      = azurerm_nat_gateway.gw.id
  public_ip_prefix_id = each.value.public_ip_prefix_id
}

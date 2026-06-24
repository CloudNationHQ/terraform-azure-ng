# nat gateway
resource "azurerm_nat_gateway" "this" {
  name                    = var.config.name
  resource_group_name     = coalesce(var.vault.resource_group_name, var.resource_group_name)
  location                = coalesce(var.vault.location, var.location)
  sku_name                = var.config.sku_name
  idle_timeout_in_minutes = var.config.idle_timeout_in_minutes
  zones                   = var.config.zones

  tags = coalesce(
    var.config.tags, var.tags
  )
}

# subnet associations
resource "azurerm_subnet_nat_gateway_association" "this" {
  for_each = lookup(
    lookup(var.config, "associations", {}), "subnets", {}
  )

  subnet_id      = each.value.subnet_id
  nat_gateway_id = azurerm_nat_gateway.this.id
}

# public ip associations
resource "azurerm_nat_gateway_public_ip_association" "this" {
  for_each = lookup(
    lookup(var.config, "associations", {}), "public_ips", {}
  )

  nat_gateway_id       = azurerm_nat_gateway.this.id
  public_ip_address_id = each.value.public_ip_address_id
}

# public ip prefix associations
resource "azurerm_nat_gateway_public_ip_prefix_association" "this" {
  for_each = lookup(
    lookup(var.config, "associations", {}), "public_ip_prefixes", {}
  )

  nat_gateway_id      = azurerm_nat_gateway.this.id
  public_ip_prefix_id = each.value.public_ip_prefix_id
}

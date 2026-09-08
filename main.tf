# nat gateway
resource "azurerm_nat_gateway" "this" {
  resource_group_name = coalesce(
    var.nat_gateway.resource_group_name, var.resource_group_name
  )

  location = coalesce(
    var.nat_gateway.location, var.location
  )

  name                    = var.nat_gateway.name
  sku_name                = var.nat_gateway.sku_name
  idle_timeout_in_minutes = var.nat_gateway.idle_timeout_in_minutes
  zones                   = var.nat_gateway.zones

  tags = coalesce(
    var.nat_gateway.tags, var.tags
  )
}

# subnet association
resource "azurerm_subnet_nat_gateway_association" "this" {
  for_each = var.nat_gateway.associations.subnets

  subnet_id      = each.value.subnet_id
  nat_gateway_id = azurerm_nat_gateway.this.id
}

# public ip association
resource "azurerm_nat_gateway_public_ip_association" "this" {
  for_each = var.nat_gateway.associations.public_ips

  nat_gateway_id       = azurerm_nat_gateway.this.id
  public_ip_address_id = each.value.public_ip_address_id
}

# public ip prefix association
resource "azurerm_nat_gateway_public_ip_prefix_association" "this" {
  for_each = var.nat_gateway.associations.public_ip_prefixes

  nat_gateway_id      = azurerm_nat_gateway.this.id
  public_ip_prefix_id = each.value.public_ip_prefix_id
}
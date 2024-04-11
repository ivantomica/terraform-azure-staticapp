resource "azurerm_static_web_app" "site" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku_tier = var.sku
  sku_size = var.sku

  dynamic "identity" {
    for_each = var.identity

    content {
      type         = identity.value.type
      identity_ids = identity.value.ids
    }
  }

  app_settings = var.app_settings
  tags         = var.tags
}

resource "azurerm_static_site_custom_domain" "domain" {
  for_each = var.custom_domains

  domain_name       = each.key
  static_web_app_id = azurerm_static_web_app.site.id
  validation_type   = each.value
}

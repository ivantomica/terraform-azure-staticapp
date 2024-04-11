moved {
  from = azurerm_static_site.site
  to   = azurerm_static_web_app.site
}

moved {
  from = azurerm_static_site_custom_domain.domain
  to   = azurerm_static_web_app_custom_domain.domain
}

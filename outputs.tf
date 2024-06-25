output "validation_token" {
  value = {
    for k, v in azurerm_static_web_app_custom_domain.domain.validation_token : k => v.validation_token
  }
}

output "id" {
  value = azurerm_static_web_app.site.id
}

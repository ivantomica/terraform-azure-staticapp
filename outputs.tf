output "validation_token" {
  value = {
    for k, v in azurerm_static_web_app_custom_domain.domain : k => v.validation_token
  }
}

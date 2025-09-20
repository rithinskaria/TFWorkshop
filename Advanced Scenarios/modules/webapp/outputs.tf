output "hostname" {
  value = "https://${azurerm_windows_web_app.web_app.name}.azurewebsites.net"
}

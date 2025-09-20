resource "azurerm_windows_web_app" "web_app" {
  name                = var.myapp
  resource_group_name = var.myrg
  location            = var.mylocation
  service_plan_id     = var.myasp

  site_config {
    application_stack {
      current_stack  = "dotnet"
      dotnet_version = "v6.0"
    }
  }
}

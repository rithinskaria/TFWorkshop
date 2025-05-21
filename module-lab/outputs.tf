output "web_app_urls" {
  value = {
    for app, mod in module.webapps :
    app => "${mod.hostname}"
  }
}

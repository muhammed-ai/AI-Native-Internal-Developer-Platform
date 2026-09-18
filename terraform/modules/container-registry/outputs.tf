output "id" {
  description = "Container registry resource ID."
  value       = azurerm_container_registry.this.id
}

output "name" {
  description = "Container registry name."
  value       = azurerm_container_registry.this.name
}

output "login_server" {
  description = "Registry login server (e.g. myregistry.azurecr.io)."
  value       = azurerm_container_registry.this.login_server
}

#-----------------
# Management Lock
#-----------------
resource "azurerm_management_lock" "management_lock" {
  count      = var.enable_management_lock == true ? 1 : 0
  name       = "mgmt-lock-${azurerm_linux_web_app.linux_web_app.name}"
  scope      = azurerm_linux_web_app.linux_web_app.id
  lock_level = "CanNotDelete"
  notes      = "Locked to prevent deletion"
}
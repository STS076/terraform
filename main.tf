variable "project_name" {
  type        = string 
  description = "Project's name"
  default     = "stoussaint"
}


resource "azurerm_resource_group" "app01" {
  name     = "rg-${var.project_name}-01"
  location = "West Europe"
}

resource "azurerm_service_plan" "plan01" {
  name                = "asp-${var.project_name}-01"
  resource_group_name = azurerm_resource_group.app01.name
  location            = azurerm_resource_group.app01.location
  sku_name            = "P1v2"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "webapp01" {
  name                = "app-${var.project_name}-01"
  resource_group_name = azurerm_resource_group.app01.name
  location            = azurerm_service_plan.plan01.location
  service_plan_id     = azurerm_service_plan.plan01.id

  site_config {}
}
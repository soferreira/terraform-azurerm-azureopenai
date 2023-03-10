resource "random_integer" "this" {
  min = 100000
  max = 999999
}


locals {
  tags = {
    Application_Name = "var.application_name"
    Environment      = "var.environment"
  }
  azureopenai_account_name = var.azureopenai_account_name != "" ? var.azureopenai_account_name : "openai-${random_integer.this.result}"
  location             = var.location != "" ? var.location : data.azurerm_resource_group.this.location
}
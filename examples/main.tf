#---------------
# Random String
#---------------
module "random_string" {
  source = "git::https://github.com/QuestOpsHub/terraform-azurerm-random-string.git?ref=v1.0.0"

  length  = 4
  lower   = true
  numeric = true
  special = false
  upper   = false
}

#----------------
# Resource Group
#----------------
module "resource_group" {
  source = "git::https://github.com/QuestOpsHub/terraform-azurerm-resource-group.git?ref=v1.0.0"

  name     = "rg-${local.resource_suffix}-${module.random_string.result}"
  location = "centralus"
  tags     = merge(local.resource_tags, local.timestamp_tag)
}

#--------------
# Service Plan
#--------------
module "service_plan" {
  source = "git::https://github.com/QuestOpsHub/QuestOpsHub-terraform-azure-modules.git//servicePlan?ref=main"

  name                = "asp-${local.resource_short}-${local.resource_suffix}-${module.random_string.result}"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  os_type             = "Linux"
  sku_name            = "P1v2"
  tags                = module.resource_group.tags
}

#---------------
# Linux Web App
#---------------
module "linux_web_app" {
  source = "git::https://github.com/QuestOpsHub/QuestOpsHub-terraform-azure-modules.git//linuxWebApp?ref=main"

  name                = "${local.resource_short}-${local.resource_suffix}-${module.random_string.result}"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  service_plan_id     = module.service_plan.id
  site_config = {
    always_on                               = true
    application_stack                       = {}
    container_registry_use_managed_identity = true
    cors                                    = {}
    ftps_state                              = "Disabled"
    health_check_path                       = "/remoteEntry.js"
    health_check_eviction_time_in_min       = 5
    http2_enabled                           = true
    load_balancing_mode                     = "WeightedRoundRobin"
    minimum_tls_version                     = "1.2"
  }
  app_settings = {}
  logs = {
    detailed_error_messages = false
    failed_request_tracing  = false
    http_logs = {
      file_system = {
        retention_in_days = 5
        retention_in_mb   = 25
      }
    }
  }
  tags = module.resource_group.tags
}
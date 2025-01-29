#---------------
# Linux Web App
#---------------
variable "name" {
  description = "(Required) The name which should be used for this Linux Web App. Changing this forces a new Linux Web App to be created."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the Resource Group where the Linux Web App should exist. Changing this forces a new Linux Web App to be created."
  type        = string
}

variable "location" {
  description = "(Required) The Azure Region where the Linux Web App should exist. Changing this forces a new Linux Web App to be created."
  type        = string
}

variable "service_plan_id" {
  description = "(Required) The ID of the Service Plan that this Linux App Service will be created in."
  type        = string
}

variable "site_config" {
  description = "(Required) A site_config block."
  type        = any
}

variable "app_settings" {
  description = "(Optional) A map of key-value pairs for App Settings and custom values."
  type        = any
  default     = {}
}

variable "auth_settings" {
  description = "(Optional) A auth_settings block."
  type        = any
  default     = {}
}

variable "auth_settings_v2" {
  description = "(Optional) A auth_settings_v2 block."
  type        = any
  default     = {}
}

variable "backup" {
  description = "(Optional) A backup block."
  type        = any
  default     = {}
}

variable "client_affinity_enabled" {
  description = "(Optional) Should Client Affinity be enabled?"
  type        = bool
  default     = null
}

variable "client_certificate_enabled" {
  description = "(Optional) Should Client Certificates be enabled?"
  type        = bool
  default     = null
}

variable "client_certificate_mode" {
  description = "(Optional) The Client Certificate mode. Possible values are Required, Optional, and OptionalInteractiveUser. This property has no effect when client_certificate_enabled is false. Defaults to Required."
  type        = string
  default     = "Required"
}

variable "client_certificate_exclusion_paths" {
  description = "(Optional) Paths to exclude when using client certificates, separated by ;"
  type        = any
  default     = null
}

variable "connection_string" {
  description = "(Optional) One or more connection_string blocks."
  type        = any
  default     = {}
}

variable "enabled" {
  description = "(Optional) Should the Linux Web App be enabled? Defaults to true"
  type        = bool
  default     = true
}

variable "ftp_publish_basic_authentication_enabled" {
  description = "(Optional) Should the default FTP Basic Authentication publishing profile be enabled. Defaults to true."
  type        = bool
  default     = true
}

variable "https_only" {
  description = "(Optional) Should the Linux Web App require HTTPS connections. Defaults to false."
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "(Optional) Should public network access be enabled for the Web App. Defaults to true."
  type        = bool
  default     = true
}

variable "identity" {
  description = "(Optional) An identity block"
  type        = any
  default     = {}
}

variable "key_vault_reference_identity_id" {
  description = "(Optional) The User Assigned Identity ID used for accessing KeyVault secrets. The identity must be assigned to the application in the identity block."
  type        = string
  default     = null
}

variable "logs" {
  description = "(Optional) A logs block."
  type        = any
  default     = {}
}

variable "storage_account" {
  description = "(Optional) One or more storage_account blocks."
  type        = any
  default     = {}
}

variable "sticky_settings" {
  description = "(Optional) A sticky_settings block."
  type        = any
  default     = {}
}

variable "virtual_network_subnet_id" {
  description = "(Optional) The subnet id which will be used by this Web App for regional virtual network integration."
  type        = string
  default     = null
}

variable "webdeploy_publish_basic_authentication_enabled" {
  description = " (Optional) Should the default WebDeploy Basic Authentication publishing credentials enabled. Defaults to true."
  type        = bool
  default     = true
}

variable "zip_deploy_file" {
  description = "(Optional) The local path and filename of the Zip packaged application to deploy to this Linux Web App."
  type        = any
  default     = null
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(any)
  default     = {}
}

#--------------------
# Linux Web App Slot
#--------------------
variable "enable_staging_slot" {
  description = "(Optional) Should the Linux Web App Staging Slot be enabled? Defaults to false"
  default     = false
  type        = bool
}

variable "slot_app_settings" {
  description = "(Optional) A map of key-value pairs for App Settings and custom values."
  type        = any
  default     = {}
}

variable "slot_https_only" {
  description = "(Optional) Should the Linux Web App Staging Slot require HTTPS connections. Defaults to false."
  type        = bool
  default     = false
}

variable "staging_slot_service_plan_id" {
  description = "(Optional) The ID of the Service Plan in which to run this slot. If not specified the same Service Plan as the Linux Web App will be used."
  default     = null
  type        = string
}

#-----------------
# Management Lock
#-----------------
variable "enable_management_lock" {
  description = "(Optional) Should the Linux Web App Management Lock be enabled? Defaults to false"
  default     = false
  type        = bool
}
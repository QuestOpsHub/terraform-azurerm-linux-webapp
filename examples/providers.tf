#--------------------
# Required Providers
#--------------------
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.8.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">=3.6.3"
    }
  }
  required_version = ">=0.13"
}

provider "azurerm" {
  features {}
  subscription_id = "f5db7161-4296-45e8-96e3-e67567aa1b22"
}
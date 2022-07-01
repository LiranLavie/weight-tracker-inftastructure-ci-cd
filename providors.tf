#Set provider
terraform {
  required_version = ">=0.12"
  required_providers {
     azurerm = {
       source = "hashicorp/azurerm"
       version = "~>2.0"
     }
   }
    backend "azurerm" {
    resource_group_name  = "terraform_resource_group"
    storage_account_name = "terraform011"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  # key delete for safety
    access_key           = ""

  }
 }
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
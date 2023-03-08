terraform {
    backend "azurerm" {
     resource_group_name  = "MigrationRG"
     storage_account_name = "migstracc"
     container_name       = "tfstate"
     key                  = "winvm.terraform.tfstate"
   }
}
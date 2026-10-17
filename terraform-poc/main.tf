terraform {
  required_version = ">= 1.13.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}

  use_oidc        = true
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "client_id" {
  type = string
}

resource "azurerm_storage_account" "poc" {
  name                     = var.storage_account_name
  resource_group_name      = "rg-github-runner-poc"
  location                 = "centralindia"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    Purpose = "ACA-GitHub-Runner-POC"
  }
}

variable "storage_account_name" {
  type = string
}
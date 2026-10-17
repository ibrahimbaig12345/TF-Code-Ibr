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

resource "azurerm_resource_group_template_deployment" "poc" {
  name                = "aca-runner-terraform-poc"
  resource_group_name = "rg-github-runner-poc"
  deployment_mode     = "Incremental"

  template_content = <<TEMPLATE
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "resources": [],
  "outputs": {
    "runnerValidation": {
      "type": "string",
      "value": "ACA-Terraform-OIDC-Success"
    }
  }
}
TEMPLATE
}

output "runner_validation" {
  value = azurerm_resource_group_template_deployment.poc.output_content
}
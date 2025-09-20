terraform {
    backend "azurerm" {
      resource_group_name = "rg-qe-workshop-riskaria"
        storage_account_name = "saqeworkshopriskaria"
        container_name = "terraform"
        key = "count.tfstate"
    }
    
}
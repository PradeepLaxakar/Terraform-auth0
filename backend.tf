terraform {
  backend "azurerm" {
    resource_group_name  = "Auth0-Stage"
    storage_account_name = "auth0stage"
    container_name       = "terraform-state-files"
    key                  = "stage-terraform-tfstate-file"
    #access_key           = "Passing from Pipeline secrets"
  }
}

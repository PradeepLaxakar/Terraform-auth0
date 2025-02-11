terraform {
  required_version = ">= 1.7.0"

  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "~> 1.1.2"
    }
  }
}

provider "auth0" {
  domain        = var.auth0_domain
  client_id     = var.auth0_client_id
  client_secret = var.auth0_client_secret
}

resource "auth0_connection" "db1" {
  name     = "dev-Connection"
  strategy = "auth0"
}

resource "auth0_organization" "my_organization" {
  name         = "Project-organization"
  display_name = "My Organization"
}

resource "auth0_organization_connection" "my_org_conn" {
  organization_id            = auth0_organization.my_organization.id
  connection_id              = auth0_connection.db1.id
  assign_membership_on_login = false
  #   is_signup_enabled          = false
  #   show_as_button             = true
}
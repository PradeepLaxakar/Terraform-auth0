terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "1.5.0"
    }
  }
}

# #API -----------------------------------------------------------------------
resource "auth0_resource_server" "api1" {
  // Settings tab
  name        = var.api1-name
  identifier  = var.api1-identifier # "https://api.example.com"
  signing_alg = "RS256"

  allow_offline_access                            = false                  #default = false when creating manually.
  token_lifetime                                  = var.api-token-lifetime #default set to 86400 when creating manually.
  skip_consent_for_verifiable_first_party_clients = true

  // RBAC Settings
  enforce_policies = true
}


# Permissions
resource "auth0_resource_server_scope" "api1-scope1" {
  resource_server_identifier = auth0_resource_server.api1.identifier
  scope                      = var.api1-permission1
  description                = var.api1-description1
}

resource "auth0_resource_server_scope" "api1-scope2" {
  resource_server_identifier = auth0_resource_server.api1.identifier
  scope                      = var.api1-permission2 #"write:posts"
  description                = var.api1-description2
}

resource "auth0_resource_server_scope" "api1-scope3" {
  resource_server_identifier = auth0_resource_server.api1.identifier
  scope                      = var.api1-permission3
  description                = var.api1-description3
}

resource "auth0_resource_server_scope" "api1-scope4" {
  resource_server_identifier = auth0_resource_server.api1.identifier
  scope                      = var.api1-permission4
  description                = var.api1-description4
}


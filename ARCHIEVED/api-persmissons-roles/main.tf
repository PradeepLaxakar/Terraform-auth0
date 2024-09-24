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

resource "auth0_resource_server" "resource_server" {
  name        = "Auth User API (Managed by Terraform)"
  identifier  = "https://api.example.com"
  signing_alg = "RS256"

  allow_offline_access                            = true
  token_lifetime                                  = 86400
  skip_consent_for_verifiable_first_party_clients = true
  enforce_policies                                = true // Enable RBAC settings
}

resource "auth0_resource_server_scopes" "resource_server_scopes" {
  resource_server_identifier = auth0_resource_server.resource_server.identifier

  scopes {
    name        = "create:loan"
    description = "Create loan application"
  }
  scopes {
    name        = "update:loan"
    description = "Update loan application"
  }
  scopes {
    name        = "get:lead"
    description = "Get lead information"
  }
}

resource "auth0_role" "Consumer_role" {
  name        = "Consumer"
  description = "This is the end user who will request for a loan."
}

resource "auth0_role_permissions" "Consumer_role_perms" {
  role_id = auth0_role.Consumer_role.id

  dynamic "permissions" {
    for_each = {
      for scope in auth0_resource_server_scopes.resource_server_scopes.scopes : scope.name => scope
      if contains(["create:loan", "update:loan"], scope.name)
    }
    content {
      name                       = permissions.value.name
      resource_server_identifier = auth0_resource_server.resource_server.identifier
    }
  }
}


resource "auth0_role" "loan_role" {
  name        = "Loan Officer"
  description = "This is the person who can accept or reject a loan application."
}

resource "auth0_role_permissions" "my_role_perms2s" {
  role_id = auth0_role.loan_role.id

  dynamic "permissions" {
    for_each = {
      for scope in auth0_resource_server_scopes.resource_server_scopes.scopes : scope.name => scope
      if contains(["create:loan", "get:lead", "update:loan"], scope.name)
    }
    content {
      name                       = permissions.value.name
      resource_server_identifier = auth0_resource_server.resource_server.identifier
    }
  }
}
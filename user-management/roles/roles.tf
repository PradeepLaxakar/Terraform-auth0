terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "1.5.0"
    }
  }
}


resource "auth0_role" "role1" {
  name        = var.role1-name
  description = var.role1-description
}


resource "auth0_role" "role2" {
  name        = var.role2-name
  description = var.role2-description
}

resource "auth0_role" "role3" {
  name        = var.role3-name
  description = var.role3-description
}


# #Attaching permissions to roles -------------------------------------------------------------
resource "auth0_role_permissions" "role1_permissions" {
  role_id = auth0_role.role1.id # Reference the created role

  permissions {
    resource_server_identifier = var.api1_identifier # Reference the API (resource server)
    name                       = var.api1-scope1
  }

  permissions {
    resource_server_identifier = var.api1_identifier # Reference the API (resource server)
    name                       = var.api1-scope2
  }
}


resource "auth0_role_permissions" "role2_permissions" {
  role_id = auth0_role.role2.id # Reference the created role

  permissions {
    resource_server_identifier = var.api1_identifier # Reference the API (resource server)
    name                       = var.api1-scope1
  }

  permissions {
    resource_server_identifier = var.api1_identifier # Reference the API (resource server)
    name                       = var.api1-scope2
  }

  permissions {
    resource_server_identifier = var.api1_identifier # Reference the API (resource server)
    name                       = var.api1-scope3
  }

}


resource "auth0_role_permissions" "role3_permissions" {
  role_id = auth0_role.role3.id # Reference the created role

  permissions {
    resource_server_identifier = var.api1_identifier # Reference the API (resource server)
    name                       = var.api1-scope1
  }

  permissions {
    resource_server_identifier = var.api1_identifier # Reference the API (resource server)
    name                       = var.api1-scope2
  }

  permissions {
    resource_server_identifier = var.api1_identifier # Reference the API (resource server)
    name                       = var.api1-scope3
  }

  permissions {
    resource_server_identifier = var.api1_identifier # Reference the API (resource server)
    name                       = var.api1-scope4
  }
}

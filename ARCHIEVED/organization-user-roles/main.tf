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

resource "auth0_role" "reader" {
  name = "Reader"
}

resource "auth0_role" "writer" {
  name = "Writer"
}

resource "auth0_user" "user" {
  connection_name = "Username-Password-Authentication"
  email           = "test-user@auth0.com"
  password        = "MyPass123$"
}

resource "auth0_organization" "my_org" {
  name         = "some-org"
  display_name = "Some Org"
}

resource "auth0_organization_member" "my_org_member" {
  organization_id = auth0_organization.my_org.id
  user_id         = auth0_user.user.id
}

resource "auth0_organization_member_roles" "my_org_member_roles" {
  organization_id = auth0_organization.my_org.id
  user_id         = auth0_user.user.id
  roles           = [auth0_role.reader.id, auth0_role.writer.id]
}
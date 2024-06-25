terraform {
  required_providers {
    auth0 = {
      source = "auth0/auth0"
      version = "1.3.0"
    }
  }
}
provider "auth0" {}


// We are appending on main.tf
resource "auth0_client" "my_client" {
  name            = "WebAppExample"
  description     = "My Web App Created Through Terraform"
  app_type        = "regular_web"
  callbacks       = ["http://localhost:3000/callback"]
  oidc_conformant = true

  jwt_configuration {
    alg = "RS256"
  }
}

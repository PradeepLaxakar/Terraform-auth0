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

resource "auth0_action" "Rules_legacy" {
  name    = format("Rules (legacy)")
  runtime = "node18"
  deploy  = true
  code    = file("${path.module}/scripts/Rules(legacy).js")

  supported_triggers {
    id      = "post-login"
    version = "v3"
  }

  #   dependencies {
  #     name    = "lodash"
  #     version = "latest"
  #   }

  #   dependencies {
  #     name    = "request"
  #     version = "latest"
  #   }

  #   secrets {
  #     name  = "FOO"
  #     value = "Foo"
  #   }

  #   secrets {
  #     name  = "BAR"
  #     value = "Bar"
  #   }
}

resource "auth0_action" "redirect_signup" {
  name    = format("Redirect Signup")
  runtime = "node18"
  deploy  = true
  code    = file("${path.module}/scripts/redirect_signup.js")

  supported_triggers {
    id      = "post-login"
    version = "v3"
  }
}

resource "auth0_action" "add_roles" {
  name    = format("Add Roles")
  runtime = "node18"
  deploy  = true
  code    = file("${path.module}/scripts/add_roles.js")

  supported_triggers {
    id      = "post-login"
    version = "v3"
  }
}

resource "auth0_action" "add_data_token" {
  name    = format("Add Data Token")
  runtime = "node18"
  deploy  = true
  code    = file("${path.module}/scripts/add_data_token.js")

  supported_triggers {
    id      = "post-login"
    version = "v3"
  }
}
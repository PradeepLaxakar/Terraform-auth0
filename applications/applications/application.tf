terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "1.5.0"
    }
  }
}


#Application1 - Project Consumer ----------------------------------------------
resource "auth0_client" "application1" {
  name                 = var.application1-name
  app_type             = var.application1-app-type
  custom_login_page_on = var.custom-login-page-on
  is_first_party       = true
  oidc_conformant      = true
  logo_uri             = var.application1-logo-uri
  initiate_login_uri   = var.application1-login-uri
  callbacks            = var.application1-allowed-callback-urls
  allowed_logout_urls  = var.application1-allowed-logout-urls
  web_origins          = var.application1-web-origins
  allowed_origins      = var.application1-allowed-origins
  # sso                  = var.false # Use AuthO instead of the IdP to do Single Sign On - Not working
  grant_types = [
    "authorization_code",
    "http://auth0.com/oauth/grant-type/password-realm",
    "implicit",
    "password",
    "refresh_token"
  ]

  client_metadata = {
    #  key1 = "value1"
    #  key2 = "value2"
  }

  cross_origin_auth = var.true #Cross-Origin Authentication


  jwt_configuration {
    lifetime_in_seconds = var.application1-id-token-expiration #36000
    secret_encoded      = true
    alg                 = "RS256"
    scopes = {
      #  key = "value"
    }
  }

  refresh_token {
    leeway                       = 0
    token_lifetime               = var.application1-absolute-lifetime #2592000
    rotation_type                = "rotating"
    expiration_type              = "expiring"
    infinite_idle_token_lifetime = var.false
  }

}


#Application2 - Project Loan Officer ----------------------------------------------
resource "auth0_client" "application2" {
  name                 = var.application2-name
  app_type             = var.application2-app-type
  custom_login_page_on = var.custom-login-page-on
  is_first_party       = true
  oidc_conformant      = true
  logo_uri             = var.application2-logo-uri
  initiate_login_uri   = var.application1-login-uri
  callbacks            = var.application2-allowed-callback-urls
  allowed_logout_urls  = var.application2-allowed-logout-urls
  web_origins          = var.application2-web-origins
  allowed_origins      = var.application2-allowed-origins
  grant_types = [
    "authorization_code",
    "http://auth0.com/oauth/grant-type/password-realm",
    "implicit",
    "password",
    "refresh_token"
  ]

  client_metadata = {
    #  key1 = "value1"
    #  key2 = "value2"
  }

  cross_origin_auth = var.true #Cross-Origin Authentication

  jwt_configuration {
    lifetime_in_seconds = var.application2-id-token-expiration #36000
    secret_encoded      = true
    alg                 = "RS256"
    scopes = {
      #  key = "value"
    }
  }

  refresh_token {
    leeway                       = 0
    token_lifetime               = var.application2-absolute-lifetime #2592000
    rotation_type                = "rotating"
    expiration_type              = "expiring"
    infinite_idle_token_lifetime = var.false
  }
}

// ----------------------------------------------------------------------------------------------------------------------------------- ///


terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "1.5.0"
    }
  }
}

# Google OAuth2 connection.
resource "auth0_connection" "google_oauth2" {
  name     = var.google-connection-name
  strategy = "google-oauth2"

  options {
    client_id                = var.GOOGLE_CLIENT_ID
    client_secret            = var.GOOGLE_CLIENT_SECRET
    allowed_audiences        = var.allowed-audiences #["example.com", "api.example.com"] // client IDs of applications that are allowed to use the connection //
    scopes                   = var.scopes            # Permissions ["email", "profile", "gmail", "youtube"] 
    set_user_root_attributes = "on_each_login"
    non_persistent_attrs     = [""] # ["ethnicity", "gender"] // fields that should not be stored in Auth0 databases.
  }
}



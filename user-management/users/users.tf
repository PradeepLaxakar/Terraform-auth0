terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "1.5.0"
    }
  }
}

# module "database" {
#   source             = "../authentication"
# }

# ===================================================================================

resource "auth0_user" "user" {
  connection_name = var.db_connection1-name
  user_id         = "12345"
  #  username        = "tf_user"
  name           = "Terra Form"
  email          = "terra@form.com"
  email_verified = true
  password       = "Techdome@12345"
  #  picture         = "https://www.example.com/a-valid-picture-url.jpg"
}


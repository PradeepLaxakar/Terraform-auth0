terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "1.5.0"
    }
  }
}

// email provider Azure CS.
resource "auth0_email_provider" "my_email_provider" {
  name                 = var.email-provider
  enabled              = var.use-my-own-email-provider #true
  default_from_address = var.default-from-address

  credentials {
    azure_cs_connection_string = var.AZURE_CS_CONNECTION_STRING
  }
}


// Email template
resource "auth0_email_template" "my_email_template" {
  depends_on = [auth0_email_provider.my_email_provider]

  template                = var.template-verification-email
  body                    = file("${path.module}/Message.html")
  from                    = var.from
  result_url              = var.redirect-to
  subject                 = var.email-subject
  syntax                  = "liquid"
  url_lifetime_in_seconds = var.url-lifetime-in-seconds-432000
  enabled                 = var.status-enabled
}




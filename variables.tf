// Common variables -------------------------------------------
// Bool
variable "true" {
  type    = bool
  default = true
}

variable "false" {
  type    = bool
  default = false
}

// Numbers
variable "number0" {
  type    = number
  default = 0
}

variable "number1" {
  type    = number
  default = 1
}

variable "number2" {
  type    = number
  default = 2
}

variable "number3" {
  type    = number
  default = 3
}

variable "number16" {
  type    = number
  default = 16
}

variable "number25" {
  type    = number
  default = 25
}

variable "number50" {
  type    = number
  default = 50
}

variable "number87_5" {
  type    = number
  default = 87.5
}

variable "number100" {
  type    = number
  default = 100
}

variable "number150" {
  type    = number
  default = 150
}

// Directions
variable "left" {
  default = "left"
}

variable "right" {
  default = "right"
}

variable "center" {
  default = "center"
}

variable "top" {
  default = "top"
}

// Applications -------------------------------------------
variable "custom-login-page-on" {}


// Application1
variable "application1-name" {}
variable "application1-app-type" {}
variable "application1-login-uri" {}

variable "application1-allowed-callback-urls" {
  type = list(string)
}

variable "application1-allowed-origins" {
  type = list(string)
}

variable "application1-allowed-logout-urls" {
  type = list(string)
}

variable "application1-web-origins" {
  type = list(string)
}

variable "application1-logo-uri" {}


// Application2 
variable "application2-name" {}
variable "application2-app-type" {}
variable "application2-login-uri" {}

variable "application2-allowed-callback-urls" {
  type = list(string)
}

variable "application2-allowed-origins" {
  type = list(string)
}

variable "application2-allowed-logout-urls" {
  type = list(string)
}

variable "application2-web-origins" {
  type = list(string)
}

variable "application2-logo-uri" {}


// API ---------------------------------------------
# variable api1-id {}

variable "api1-name" {}

variable "api1-identifier" {}

variable "api-token-lifetime" {}

variable "api1-permission1" {}

variable "api1-description1" {}

variable "api1-permission2" {}

variable "api1-description2" {}

variable "api1-permission3" {}

variable "api1-description3" {}

variable "api1-permission4" {}

variable "api1-description4" {}


// Authentication --------------------------------------
// Database
variable "db_connection1-name" {}
variable "DB_CONNECTION_STRING" {}

// Social
variable "google-connection-name" {}
variable "GOOGLE_CLIENT_ID" {}
variable "GOOGLE_CLIENT_SECRET" {}
variable "allowed-audiences" {}
variable "scopes" {}

// user-management ------------------------------------
// users

// Roles
variable "role1-name" {}
variable "role1-description" {}

variable "role2-name" {}
variable "role2-description" {}

variable "role3-name" {}
variable "role3-description" {}


// Branding ------------------------------------------------------
// Custom Domain
variable "custom-domain" {}


// Universal_login
variable "logo-url" {}

// Customizatiom theme
variable "primary-button" {}
variable "primary-button-label" {}
variable "secondary-button-border" {}
variable "secondary-button-label" {}
# Base Focus Color Not available
# Base Hover Color Not available
variable "links-focused-components" {}
variable "header" {}
variable "body-text" {}
variable "widget-background" {}
variable "widget-border" {}
variable "input-labels-placeholders" {}
variable "input-filled-text" {}
variable "input-border" {}
variable "input-background" {}
variable "icons" {}
variable "error" {}
variable "success" {}
# Captcha Widget Theme not available

// Email
variable "default-from-address" {}
variable "AZURE_CS_CONNECTION_STRING" {}

// Email template
variable "template-verification-email" {}
variable "status-enabled" {
  type = bool
}
variable "from" {}
variable "email-subject" {}
variable "redirect-to" {}
# syntax                  = "liquid" 
variable "url-lifetime-in-seconds-432000" {}



// common variables
variable "widget-logo-url" {}
variable "font-url" {}
variable "links-style-normal" {}
variable "borders-buttons-style-pill" {}
variable "borders-inputs-style-pill" {}
variable "page-background-background-color" {}
variable "page-background-background-image-url" {}


// Actions ----------------------------------------------------------- //
// Library //
// Action1 //
variable "action1-name" {}

variable "actions-runtime" {}

variable "action1-trigger" {}

variable "action1-trigger-version" {}

variable "action1-dependencies1-name" {}

variable "action1-dependencies1-version" {}

// Action2 //
variable "action2-name" {}

variable "action2-trigger" {}

variable "action2-trigger-version" {}

variable "action2-dependencies1-name" {}

variable "action2-dependencies1-version" {}

variable "action2-dependencies2-name" {}

variable "action2-dependencies2-version" {}

variable "action2-secret1-name" {}

variable "action2-secret1-value" {}

variable "action2-secret2-name" {}

variable "action2-secret2-value" {}

variable "action2-secret3-name" {}

variable "action2_secret3_value" {}

// action3 //
variable "action3-name" {}

variable "action3-trigger" {}

variable "action3-trigger-version" {}

variable "action3-dependencies1-name" {}

variable "action3-dependencies1-version" {}

variable "action3-secret1-name" {}

variable "action3_secret1_value" {}

// action4 //
variable "action4-name" {}

variable "action4-trigger" {}

variable "action4-trigger-version" {}

variable "action4-secret1-name" {}

variable "action4_secret1_value" {}

// action5 //
variable "action5-name" {}

variable "action5-trigger" {}

variable "action5-trigger-version" {}

variable "action5-secret1-name" {}

variable "action5_secret1_value" {}

// Action6 //
variable "action6-name" {}

variable "action6-trigger" {}

variable "action6-trigger-version" {}

variable "action6-dependencies1-name" {}

variable "action6-dependencies1-version" {}

variable "action6-secret1-name" {}

variable "action6-secret1-value" {}

variable "action6-secret2-name" {}

variable "action6_secret2_value" {}

variable "action6-secret3-name" {}

variable "action6_secret3_value" {}

variable "action6-secret4-name" {}

variable "action6_secret4_value" {}

variable "action6-secret5-name" {}

variable "action6_secret5_value" {}

// Applications ----------------------------------------------------------------------- //
module "applications" {
  source               = "./applications/applications"
  custom-login-page-on = var.custom-login-page-on

  // application1
  true                               = var.true
  false                              = var.false
  application1-name                  = var.application1-name
  application1-app-type              = var.application1-app-type
  application1-login-uri             = var.application1-login-uri
  application1-allowed-callback-urls = var.application1-allowed-callback-urls
  application1-allowed-origins       = var.application1-allowed-origins
  application1-allowed-logout-urls   = var.application1-allowed-logout-urls
  application1-web-origins           = var.application1-web-origins
  application1-logo-uri              = var.application1-logo-uri
  application1-id-token-expiration   = var.application1-id-token-expiration
  application1-absolute-lifetime     = var.application1-absolute-lifetime


  // application2
  application2-name                  = var.application2-name
  application2-app-type              = var.application2-app-type
  application2-login-uri             = var.application2-login-uri
  application2-allowed-callback-urls = var.application2-allowed-callback-urls
  application2-allowed-origins       = var.application2-allowed-origins
  application2-allowed-logout-urls   = var.application2-allowed-logout-urls
  application2-web-origins           = var.application2-web-origins
  application2-logo-uri              = var.application2-logo-uri
  application2-id-token-expiration   = var.application2-id-token-expiration
  application2-absolute-lifetime     = var.application2-absolute-lifetime

}


module "api" {
  source             = "./applications/api"
  api1-name          = var.api1-name
  api1-identifier    = var.api1-identifier
  api-token-lifetime = var.api-token-lifetime
  api1-permission1   = var.api1-permission1
  api1-description1  = var.api1-description1
  api1-permission2   = var.api1-permission2
  api1-description2  = var.api1-description2
  api1-permission3   = var.api1-permission3
  api1-description3  = var.api1-description3
  api1-permission4   = var.api1-permission4
  api1-description4  = var.api1-description4
}


// Authentication -------------------------------------------------------------------- //
module "authentication" {
  source = "./authentication"

  // Database
  db1-name             = var.db1-name
  DB_CONNECTION_STRING = var.DB_CONNECTION_STRING

  db1-require-username    = var.db1-require-username
  db1-username-length-min = var.db1-username-length-min
  db1-username-length-max = var.db1-username-length-max
  db1-disable-signup      = var.db1-disable-signup
  use-my-own-database     = var.use-my-own-database

  // Social
  social-platform                            = var.social-platform
  google-connection-name                     = var.google-connection-name
  GOOGLE_CLIENT_ID                           = var.GOOGLE_CLIENT_ID
  GOOGLE_CLIENT_SECRET                       = var.GOOGLE_CLIENT_SECRET
  allowed-audiences                          = var.allowed-audiences
  scopes                                     = var.scopes
  sync-user-profile-attributes-at-each-login = var.sync-user-profile-attributes-at-each-login
}


// user-management -------------------------------------------------------------------- //
// module "users" {
//   source              = "./user-management/users"
//   db1-name = module.database.db1-name
// }


module "roles" {
  source            = "./user-management/roles"
  role1-name        = var.role1-name
  role1-description = var.role1-description
  role2-name        = var.role2-name
  role2-description = var.role2-description
  role3-name        = var.role3-name
  role3-description = var.role3-description

  // Api module values
  api1-id         = module.api.api1-id
  api1_identifier = module.api.api1-identifier
  api1-scope1     = module.api.api1-scope1
  api1-scope2     = module.api.api1-scope2
  api1-scope3     = module.api.api1-scope3
  api1-scope4     = module.api.api1-scope4
}

// Branding -------------------------------------------------------------------------- //
// Universal_login
module "universal_login" {
  source = "./branding/universal_login"

  //custom domain
  custom-domain = var.custom-domain

  logo-url   = var.logo-url
  number0    = var.number0
  number1    = var.number1
  number2    = var.number2
  number3    = var.number3
  number16   = var.number16
  number25   = var.number25
  number50   = var.number50
  number87_5 = var.number87_5
  number100  = var.number100
  number150  = var.number150
  false      = var.false
  true       = var.true
  center     = var.center
  top        = var.top

  // Customizatiom theme
  primary-button          = var.primary-button
  primary-button-label    = var.primary-button-label
  secondary-button-border = var.secondary-button-border
  secondary-button-label  = var.secondary-button-label
  # Base Focus Color Not available
  # Base Hover Color Not available
  links-focused-components  = var.links-focused-components
  header                    = var.header
  body-text                 = var.body-text
  widget-background         = var.widget-background
  widget-border             = var.widget-border
  input-labels-placeholders = var.input-labels-placeholders
  input-filled-text         = var.input-filled-text
  input-border              = var.input-border
  input-background          = var.input-background
  icons                     = var.icons
  error                     = var.error
  success                   = var.success
  # Captcha Widget Theme not available

  // common variable
  widget-logo-url                      = var.widget-logo-url
  font-url                             = var.font-url
  links-style-normal                   = var.links-style-normal
  borders-buttons-style-pill           = var.borders-buttons-style-pill
  borders-inputs-style-pill            = var.borders-inputs-style-pill
  page-background-background-color     = var.page-background-background-color
  page-background-background-image-url = var.page-background-background-image-url

}

// Email
module "email" {
  // email-provider
  source                     = "./branding/email"
  email-provider             = var.email-provider
  use-my-own-email-provider  = var.use-my-own-email-provider
  default-from-address       = var.default-from-address
  AZURE_CS_CONNECTION_STRING = var.AZURE_CS_CONNECTION_STRING

  // Email template
  template-verification-email    = var.template-verification-email
  status-enabled                 = var.status-enabled
  from                           = var.from
  email-subject                  = var.email-subject
  redirect-to                    = var.redirect-to
  url-lifetime-in-seconds-432000 = var.url-lifetime-in-seconds-432000
}


// Actions -------------------------------------------------------- //
module "actions" {
  source = "./actions"

  // Library //
  action1-name                  = var.action1-name
  actions-runtime               = var.actions-runtime
  action1-trigger               = var.action1-trigger
  action1-trigger-version       = var.action1-trigger-version
  action1-dependencies1-name    = var.action1-dependencies1-name
  action1-dependencies1-version = var.action1-dependencies1-version

  action2-name                  = var.action2-name
  action2-trigger               = var.action2-trigger
  action2-trigger-version       = var.action2-trigger-version
  action2-dependencies1-name    = var.action2-dependencies1-name
  action2-dependencies1-version = var.action2-dependencies1-version
  action2-dependencies2-name    = var.action2-dependencies2-name
  action2-dependencies2-version = var.action2-dependencies2-version
  action2-secret1-name          = var.action2-secret1-name
  action2-secret1-value         = var.action2-secret1-value
  action2-secret2-name          = var.action2-secret2-name
  action2-secret2-value         = var.action2-secret2-value
  action2-secret3-name          = var.action2-secret3-name
  action2_secret3_value         = var.action2_secret3_value

  action3-name                  = var.action3-name
  action3-trigger               = var.action3-trigger
  action3-trigger-version       = var.action3-trigger-version
  action3-dependencies1-name    = var.action3-dependencies1-name
  action3-dependencies1-version = var.action3-dependencies1-version
  action3-secret1-name          = var.action3-secret1-name
  action3_secret1_value         = var.action3_secret1_value

  action4-name            = var.action4-name
  action4-trigger         = var.action4-trigger
  action4-trigger-version = var.action4-trigger-version
  action4-secret1-name    = var.action4-secret1-name
  action4_secret1_value   = var.action4_secret1_value

  action5-name            = var.action5-name
  action5-trigger         = var.action5-trigger
  action5-trigger-version = var.action5-trigger-version
  action5-secret1-name    = var.action5-secret1-name
  action5_secret1_value   = var.action5_secret1_value

  action6-name                  = var.action6-name
  action6-trigger               = var.action6-trigger
  action6-trigger-version       = var.action6-trigger-version
  action6-dependencies1-name    = var.action6-dependencies1-name
  action6-dependencies1-version = var.action6-dependencies1-version
  action6-secret1-name          = var.action6-secret1-name
  action6-secret1-value         = var.action6-secret1-value
  action6-secret2-name          = var.action6-secret2-name
  action6_secret2_value         = var.action6_secret2_value
  action6-secret3-name          = var.action6-secret3-name
  action6_secret3_value         = var.action6_secret3_value
  action6-secret4-name          = var.action6-secret4-name
  action6_secret4_value         = var.action6_secret4_value
  action6-secret5-name          = var.action6-secret5-name
  action6_secret5_value         = var.action6_secret5_value

}



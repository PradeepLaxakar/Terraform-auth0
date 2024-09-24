// Applications ------------------------------------------------------
custom-login-page-on = "true"

// Application1
application1-name                  = "PROJECT Consumer"
application1-app-type              = "spa"
application1-logo-uri              = "https://i.ibb.co/py5dkgn/Screenshot-2024-01-09-at-1-08-20-PM.png"
application1-login-uri             = "https://PROJECT-fe.azurewebsites.net/" # Application Login URI
application1-allowed-callback-urls = ["https://PROJECT-uat-fe.azurewebsites.net/dashboard", "http://localhost:5173", "https://PROJECT-uat-fe.azurewebsites.net/", "http://localhost:5173/auth0-callback-v2", "https://PROJECT-uat-fe.azurewebsites.net/auth0-callback-v2"]
application1-allowed-logout-urls   = ["http://localhost:5173", "https://PROJECT-uat-fe.azurewebsites.net/", "http://localhost:5173/verification-email"]
application1-web-origins           = ["http://localhost:5173", "https://PROJECT-uat-fe.azurewebsites.net/"]
application1-allowed-origins       = [] # Cross-Origin_Authentication > Allowed Origins (CORS)

// Application2
application2-name                  = "PROJECT Loan Officer"
application2-app-type              = "spa"
application2-logo-uri              = "https://i.ibb.co/py5dkgn/Screenshot-2024-02-09-at-2-08-20-PM.png"
application2-login-uri             = "https://PROJECT-uat-fe.azurewebsites.net/" # Application Login URI
application2-allowed-callback-urls = ["https://PROJECT-uat-fe.azurewebsites.net/", "http://localhost:5173/", "http://localhost:5173/auth0-callback", "https://PROJECT-uat-fe.azurewebsites.net/auth0-callback"]
application2-allowed-logout-urls   = ["https://PROJECT-uat-fe.azurewebsites.net/", "http://localhost:5173/"]
application2-web-origins           = ["https://PROJECT-uat-fe.azurewebsites.net/", "http://localhost:5173/"]
application2-allowed-origins       = [] # Cross-Origin_Authentication > Allowed Origins (CORS)

// api ---------------------------------------------------------------------------------
api1-name          = "Auth0 User Api"
api1-identifier    = "Auth0 User Api"
api-token-lifetime = "86400"


// permission
api1-permission1  = "create:loan"
api1-description1 = "Create loan application"

api1-permission2  = "update:loan"
api1-description2 = "Update loan application"

api1-permission3  = "get:lead"
api1-description3 = "Get lead information"

api1-permission4  = "get:reports"
api1-description4 = "Get Reports"


// Authentication -----------------------------------------------------------------
// Database
db_connection1-name = "PROJECT-Stage-DB"
# DB_CONNECTION_STRING = "Passing from secrets"

// Social
google-connection-name = "google-oauth2"
# GOOGLE_CLIENT_ID       = "Passing from secrets"
# GOOGLE_CLIENT_SECRET   = "Passing from secrets"
allowed-audiences = [""]                 // client IDs of applications that are allowed to use the connection //
scopes            = ["email", "profile"] // Permissions // Removing email and profile may break some part of the integration.

// user-management -----------------------------------------------------------------
// roles
role1-name        = "Consumer"
role1-description = "This is the end user who will request for a loan."
role2-name        = "Loan Officer"
role2-description = "This is the person who can accept or reject a loan application."
role3-name        = "Loan Officer Admin"
role3-description = "Admin of loan officers"



// Branding ------------------------------------------------------
// custom_domain
custom-domain = "auth.miralabs-test.com"

// Universal_login
logo-url = "https://i.ibb.co/py5dkgn/Screenshot-2024-01-09-at-1-08-20-PM.png"


// Customizatiom theme
primary-button          = "#3705c2"
primary-button-label    = "#ffffff"
secondary-button-border = "#c9cace"
secondary-button-label  = "#1e212a"
# Base Focus Color Not available
# Base Hover Color Not available
links-focused-components  = "#635dff"
header                    = "#1e212a"
body-text                 = "#1e212a"
widget-background         = "#ffffff"
widget-border             = "#c9cace"
input-labels-placeholders = "#65676e"
input-filled-text         = "#000000"
input-border              = "#c9cace"
input-background          = "#ffffff"
icons                     = "#65676e"
error                     = "#d03c38"
success                   = "#13a688"
# Captcha Widget Theme not available #Source - https://github.com/auth0/terraform-provider-auth0/issues/942

widget-logo-url                      = "https://i.ibb.co/pLGqVgx/Group-21773.png"
font-url                             = ""
links-style-normal                   = "normal"
borders-buttons-style-pill           = "pill"
borders-inputs-style-pill            = "pill"
page-background-background-image-url = "https://i.ibb.co/sCHRTBf/Adobe-Stock-387175600-1.png"
page-background-background-color     = "#0056d6"


// Email
default-from-address       = "DoNotReply@miralabs.ai"
AZURE_CS_CONNECTION_STRING = "PassFromGithubSecret"

// Email template
template-verification-email    = "verify_email"
status-enabled                 = true
from                           = "DoNotReply@miralabs.ai"
email-subject                  = "Welcome to PROJECT! Please Verify Your Email Address"
redirect-to                    = "https://PROJECT-uat-fe.azurewebsites.net/result_page"
url-lifetime-in-seconds-432000 = "432000"


// Actions ---------------------------------------------------------------------- //
// Library
action1-name                  = "Add data to token"
actions-runtime               = "node18"
action1-trigger               = "post-login"
action1-trigger-version       = "v3" // Trigger - https://registry.terraform.io/providers/auth0/auth0/latest/docs/guides/action_triggers //
action1-dependencies1-name    = "axios"
action1-dependencies1-version = "1.7.2"

action2-name                  = "Add roles"
action2-trigger               = "post-login"
action2-trigger-version       = "v3"
action2-dependencies1-name    = "auth0"
action2-dependencies1-version = "4.6.0"
action2-dependencies2-name    = "axios"
action2-dependencies2-version = "1.7.2"
action2-secret1-name          = "domain"
action2-secret1-value         = "value"
action2-secret2-name          = "clientId"
action2-secret2-value         = "12345"
action2-secret3-name          = "ClientSecret"
// action2_secret3_value         = "Passing from secrets" //

action3-name                  = "Check Role in DB"
action3-trigger               = "post-login"
action3-trigger-version       = "v3"
action3-dependencies1-name    = "pg"
action3-dependencies1-version = "8.12.0"
action3-secret1-name          = "DB_URI"
// action3_secret1_value         = "Passing from secrets" //

action4-name            = "Redirect Sign Up"
action4-trigger         = "post-login"
action4-trigger-version = "v3"
action4-secret1-name    = "MY_REDIRECT_SECRET-to-be-Discuss-with-Nayan"
action4_secret1_value   = "Passing from secrets" # to be discuss with Nayan

action5-name            = "Restrict Social Accounts User"
action5-trigger         = "pre-user-registration"
action5-trigger-version = "v2" // Trigger - https://registry.terraform.io/providers/auth0/auth0/latest/docs/guides/action_triggers //
action5-secret1-name    = "loanOfficerClientId-to-be-Discuss-with-Nayan"
action5_secret1_value   = "Passing from secrets" # to be discuss with Nayan

action6-name                  = "Send Verification Email"
action6-trigger               = "post-login"
action6-trigger-version       = "v3"
action6-dependencies1-name    = "auth0"
action6-dependencies1-version = "4.6.0"

action6-secret1-name  = "clientId"
action6-secret1-value = "value"

action6-secret2-name = "clientSecret"
// action6_secret2_value         = "Passing from secrets" //

action6-secret3-name  = "domain"
action6_secret3_value = "domain"

action6-secret4-name  = "myRedirectSecret"
action6_secret4_value = "value"

action6-secret5-name  = "redirectAPI"
action6_secret5_value = "value"

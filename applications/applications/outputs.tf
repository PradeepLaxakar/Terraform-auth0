# output "auth0_webapp_client_id" {
#   description = "Auth0 JavaMicroservices Client ID"
#   value       = auth0_client.oidc_client.client_id
# }

# output "auth0_webapp_client_secret" {
#   description = "Auth0 JavaMicroservices Client Secret"
#   value       = auth0_client_credentials.oidc_client_creds.client_secret
#   sensitive   = true
# }

output "application1-name" {
  value = auth0_client.application1.name
}

output "application1-app-type" {
  value = auth0_client.application1.app_type
}

output "application2-name" {
  value = auth0_client.application2.name
}

output "application2-app-type" {
  value = auth0_client.application2.app_type
}

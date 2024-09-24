# // Custom Domain. Required to create Universal Login //
# resource "auth0_custom_domain" "my_custom_domain" {
#   domain = var.custom-domain
#   type   = "auth0_managed_certs"
# }

# // Custom domain
# variable "custom-domain" {}


# output "custom-domain" {
#   value = auth0_custom_domain.my_custom_domain.domain
# }


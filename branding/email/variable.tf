// Email provider
variable "default-from-address" {}
variable "AZURE_CS_CONNECTION_STRING" {}
variable "email-provider" {}
variable "use-my-own-email-provider" {}

// Email template
variable "template-verification-email" {}
variable "status-enabled" {}
variable "from" {}
variable "email-subject" {}
variable "redirect-to" {}
# syntax                  = "liquid" 
variable "url-lifetime-in-seconds-432000" {}


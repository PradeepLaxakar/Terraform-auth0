 
Create Resource on Auth0 using Terraform

Reference
-	https://github.com/auth0/terraform-provider-auth0/blob/main/docs/guides/quickstart.md

Prerequisite
-	Terraform CLI version 1.5+ - Install Terraform
-	Jq - https://jqlang.github.io/jq/download/
-	Auth0 account
-	Auth0 CLI version 1.1+ - https://auth0.github.io/auth0-cli/
If installing in windows then run PowerShell as admin.


Create a Machine to Machine Application
For Terraform to be able to create resources in Auth0, you'll need to manually create an Auth0 Machine-to-Machine Application that allows Terraform to communicate with Auth0.

-	Head to the Applications section of your Auth0 Dashboard and click the "Create Application" button on the top right.
 




-	In the form that pops up, give your app a name like "Terraform Provider Auth0" and select "Machine to Machine Application" as the type. Click the "Create" button to be taken to the next screen.
 
 

-	You'll need to authorize your new app to call the Auth0 Management API. Select it in the dropdown and then authorize all scopes by clicking "All" in the top right of the scopes selection area. Click the "Authorize" button to continue.
 
 


-	You'll be taken to the details page for your new application. Open the "Settings" tab and copy the Domain, Client ID, and Client Secret values - you'll need them in the next step for configuring the Auth0 Provider.
 

 
Configure the Provider
Although you can put passwords, secrets, and other credentials directly into Terraform configuration files, hard-coding credentials into any Terraform configuration is not recommended, and risks secret leakage. 
Because of this you'll set your Auth0 Application credentials as environment variables instead.
-	In the terminal window where you're running Terraform, run the following commands, substituting AUTHO_DOMAIN, CLIENT_ID, and CLIENT_SECRET for your M2M app's values:
-	Note  - It may not work in window terminal. Use Git bash or VS code. Below command must run at your terraform folder.
export AUTH0_DOMAIN=***********
export AUTH0_CLIENT_ID=***********
export AUTH0_CLIENT_SECRET=***********

 


 
Terraform Provider
-	After you've set your environment variables, head back to your text editor, and add the following in main.tf or provider.tf.
terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = ">= 1.0.0" # Refer to docs for latest version
    }
  }
}

provider "auth0" {}

Or you can hard code them. 
 









The Auth0 Provider will communicate with the Auth0 Management API using the M2M credentials you've provided. Moreover, we specify the version range that we want to allow for the provider, to prevent an uncontrolled update.
-	Now run the following to initialize your terraform configuration:
terraform init

 


 
Create Auth0 resource through Terraform
Now you can start adding the Auth0 resources you want to manage through terraform. As an example let's create a new Web Application in our Auth0 Tenant.
In our main.tf from above, let's append the following 
resource "auth0_client" "my_client" {
  name            = "WebAppExample"
  description     = "My Web App Created Through Terraform"
  app_type        = "regular_web"
  callbacks       = ["http://localhost:3000/callback"]
  oidc_conformant = true

  jwt_configuration {
    alg = "RS256"
  }
}

terraform apply

 
Verify resource created
-	After apply finishes, you can verify that the application was created by going to the Auth0 Dashboard Applications page. You should see a new application called "WebAppExample", as specified in the name argument passed to the resource.
 

END ---


-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Setup the Auth0 Terraform Provider
Before you can set up the Auth0 Terraform Provider, you need to create a machine-to-machine application in Auth0 so that Terraform can communicate with the Auth0 management API. This can be done using the Auth0 CLI. Install the Auth0 CLI and login to your tenant. 
Run below command in terminal. Will work only after successful auth0 cli.
auth0 login --scopes create:client_grants

 



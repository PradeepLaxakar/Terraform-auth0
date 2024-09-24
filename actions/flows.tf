terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "1.5.0"
    }
  }
}

resource "auth0_trigger_actions" "login" {
  trigger = "post-login"

  actions {
    id           = auth0_action.action3.id
    display_name = auth0_action.action3.name
  }

  actions {
    id           = auth0_action.action6.id
    display_name = auth0_action.action6.name
  }

  actions {
    id           = auth0_action.action4.id
    display_name = auth0_action.action4.name
  }

  actions {
    id           = auth0_action.action2.id
    display_name = auth0_action.action2.name
  }

  actions {
    id           = auth0_action.action1.id
    display_name = auth0_action.action1.name
  }

  depends_on = [auth0_action.action1, auth0_action.action2, auth0_action.action3, auth0_action.action4, auth0_action.action5, auth0_action.action6]

}

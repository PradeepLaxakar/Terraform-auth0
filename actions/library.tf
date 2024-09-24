
resource "auth0_action" "action1" {
  name    = var.action1-name    # format("Test Action %s", timestamp())
  runtime = var.actions-runtime #"node18"
  deploy  = true
  code    = file("${path.module}/scripts/Add-data-to-token")

  supported_triggers {
    id      = var.action1-trigger
    version = var.action1-trigger-version
  }

  dependencies {
    name    = var.action1-dependencies1-name
    version = var.action1-dependencies1-version
  }

  # secrets {
  #   name  = "name1"
  #   value = "value1"
  # }
}

resource "auth0_action" "action2" {
  name    = var.action2-name
  runtime = var.actions-runtime #"node18"
  deploy  = true
  code    = file("${path.module}/scripts/Add-roles")

  supported_triggers {
    id      = var.action2-trigger
    version = var.action2-trigger-version
  }

  dependencies {
    name    = var.action2-dependencies1-name
    version = var.action2-dependencies1-version
  }

  dependencies {
    name    = var.action2-dependencies2-name
    version = var.action2-dependencies2-version
  }

  secrets {
    name  = var.action2-secret1-name
    value = var.action2-secret1-value
  }

  secrets {
    name  = var.action2-secret2-name
    value = var.action2-secret2-value
  }

  secrets {
    name  = var.action2-secret3-name
    value = var.action2_secret3_value
  }
}

resource "auth0_action" "action3" {
  name    = var.action3-name
  runtime = var.actions-runtime #"node18"
  deploy  = true
  code    = file("${path.module}/scripts/Check-Role-in-DB")

  supported_triggers {
    id      = var.action3-trigger
    version = var.action3-trigger-version
  }

  dependencies {
    name    = var.action3-dependencies1-name
    version = var.action3-dependencies1-version
  }

  secrets {
    name  = var.action3-secret1-name
    value = var.action3_secret1_value
  }
}

resource "auth0_action" "action4" {
  name    = var.action4-name
  runtime = var.actions-runtime #"node18"
  deploy  = true
  code    = file("${path.module}/scripts/Redirect-Sign-Up")

  supported_triggers {
    id      = var.action4-trigger
    version = var.action4-trigger-version
  }

  secrets {
    name  = var.action4-secret1-name
    value = var.action4_secret1_value
  }
}

resource "auth0_action" "action5" {
  name    = var.action5-name
  runtime = var.actions-runtime #"node18"
  deploy  = true
  code    = file("${path.module}/scripts/Redirect-Sign-Up")

  supported_triggers {
    id      = var.action5-trigger
    version = var.action5-trigger-version
  }

  secrets {
    name  = var.action5-secret1-name
    value = var.action5_secret1_value
  }
}


resource "auth0_action" "action6" {
  name    = var.action6-name
  runtime = var.actions-runtime #"node18"
  deploy  = true
  code    = file("${path.module}/scripts/Send Verification Email")

  supported_triggers {
    id      = var.action6-trigger
    version = var.action6-trigger-version
  }

  dependencies {
    name    = var.action6-dependencies1-name
    version = var.action6-dependencies1-version
  }

  secrets {
    name  = var.action6-secret1-name
    value = var.action6-secret1-value
  }

  secrets {
    name  = var.action6-secret2-name
    value = var.action6_secret2_value
  }

  secrets {
    name  = var.action6-secret3-name
    value = var.action6_secret3_value
  }

  secrets {
    name  = var.action6-secret4-name
    value = var.action6_secret4_value
  }

  secrets {
    name  = var.action6-secret5-name
    value = var.action6_secret5_value
  }
}

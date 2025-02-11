resource "auth0_connection" "db1" {
  name                 = var.db1-name
  is_domain_connection = true
  strategy             = "auth0"

  options {
    password_policy                = "excellent"
    brute_force_protection         = true
    enabled_database_customization = var.use-my-own-database #true 
    import_mode                    = false
    requires_username              = var.db1-require-username #false
    disable_signup                 = var.db1-disable-signup   # false
    custom_scripts = {
      login           = file("${path.module}/scripts/login.js")
      create          = file("${path.module}/scripts/create.js")
      verify          = file("${path.module}/scripts/verify.js")
      change_password = file("${path.module}/scripts/change_password.js")
      get_user        = file("${path.module}/scripts/get_user.js")
      delete          = file("${path.module}/scripts/delete.js")
    }

    configuration = {
      DATABASE_URI = var.DB_CONNECTION_STRING
      #   foo = "bar"
      #   bar = "baz"
    }
    upstream_params = jsonencode({
      "screen_name" : {
        "alias" : "login_hint"
      }
    })

    password_history {
      enable = true
      size   = 3
    }

    password_no_personal_info {
      enable = true
    }

    password_dictionary {
      enable     = true
      dictionary = ["password", "admin", "1234"]
    }

    password_complexity_options {
      min_length = 12
    }

    validation {
      username {
        min = var.db1-username-length-min #3
        max = var.db1-username-length-max #15
      }
    }

    mfa {
      active                 = true
      return_enroll_settings = true
    }
  }
}
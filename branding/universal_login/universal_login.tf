terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "1.5.0"
    }
  }
}

resource "auth0_branding" "my_brand" {
  logo_url = var.logo-url

  colors {
    primary         = "#0059d6"
    page_background = "#000000"
  }

  universal_login {
    # Ensure that "{%- auth0:head -%}" and "{%- auth0:widget -%}"
    # are present in the body.
    body = file("${path.module}/universal_login_body.html") # file("universal_login_body.html")
  }

  # depends_on = [auth0_custom_domain.my_custom_domain]

}

// Customization Options                                                            
# An example of a fully configured auth0_branding_theme.                           
resource "auth0_branding_theme" "my_theme" {

  colors {
    primary_button          = var.primary-button
    primary_button_label    = var.primary-button-label
    secondary_button_border = var.secondary-button-border
    secondary_button_label  = var.secondary-button-label
    # Base Focus Color Not available
    # Base Hover Color Not available
    links_focused_components  = var.links-focused-components
    header                    = var.header
    body_text                 = var.body-text
    widget_background         = var.widget-background
    widget_border             = var.widget-border
    input_labels_placeholders = var.input-labels-placeholders
    input_filled_text         = var.input-filled-text
    input_border              = var.input-border
    input_background          = var.input-background
    icons                     = var.icons
    error                     = var.error
    success                   = var.success
    # Captcha Widget Theme not available

  }

  fonts {
    font_url            = var.font-url
    reference_text_size = var.number16

    title {
      bold = var.false
      size = var.number150
    }

    subtitle {
      bold = var.false
      size = var.number87_5
    }

    body_text {
      bold = var.false
      size = var.number87_5
    }

    buttons_text {
      bold = var.false
      size = var.number100
    }

    input_labels {
      bold = var.false
      size = var.number100
    }

    links {
      bold = var.false
      size = var.number87_5
    }

    links_style = var.links-style-normal


  }

  borders {
    button_border_weight = var.number1
    buttons_style        = var.borders-buttons-style-pill
    input_border_weight  = var.number1
    inputs_style         = var.borders-inputs-style-pill
    widget_corner_radius = var.number25
    widget_border_weight = var.number0
    show_widget_shadow   = var.true

    # extra
    button_border_radius = var.number1
    input_border_radius  = var.number3
  }

  widget {
    logo_position         = var.center
    logo_url              = var.widget-logo-url
    logo_height           = var.number50
    header_text_alignment = var.center
    social_buttons_layout = var.top
  }

  page_background {
    page_layout          = var.center
    background_color     = var.page-background-background-color
    background_image_url = var.page-background-background-image-url
  }

}
module ApplicationHelper
  #before_action :copyright_generator

  def sample_helper_html
    #This will render the string as HTML
    "<p>Hi there!</p>".html_safe
  end

  def sample_helper_string
    #This will cleanup or sanitize the string
    # to strop out the HTML
    "<p>Hi there!</p>"
    #in other words, the htm will be shown as string
    # and this is good so we don't execute some malicious
    # code by mistake, ie, if an user possts crafted HTML
  end

  def login_helper
    if current_user.is_a?(GuestUser)
      (link_to "Sign in", new_user_session_path, method: :get) +
          "<br>".html_safe +
          (link_to "Register", new_user_registration_path, method: :get)
    else
      link_to "Logout #{current_user.first_name}...", destroy_user_session_path, method: :delete
    end
  end

  def source_helper
    if session[:source]
      msg = "Thanks for visiting me from #{session[:source]}"
      content_tag(:p, msg, class:"source-greeting")
    end
  end

  def copyright_generator
    @copyright = AlexViewTool::Renderer.copyright "Alejandro", "All rights reserved"
  end
end

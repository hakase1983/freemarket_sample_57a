# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  layout "compact"
  
  def facebook
    callback_for(:facebook) 
  end

  def google_oauth2
    callback_for(:google)
  end


  def callback_for(provider)
    info = User.find_oauth(request.env["omniauth.auth"]) 
    @user = info[:user]
    sns_id = info[:sns_id]
    @sns = 1
    if @user.persisted? 
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else 
      session["devise.sns_id"] = sns_id #sns_credentialのid devise.他のアクションに持ち越せる
      render template: "devise/registrations/new" 
    end
  end

  def failure
    redirect_to root_path and return
  end
  
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end

class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller? #デバイスに関する画面で機能する

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])  #元々の機能にはメアドとパスワードしか設定されていないため新しいキーを追加する時にこれを使う
  end
  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end

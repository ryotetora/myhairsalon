class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :salon_name, :like_style, :salon_hp, :prefecture, :phone])
  end
  # デフォルトで使えないパラメータの許可
end
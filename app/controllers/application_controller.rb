class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :category_id


  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def category_id
    @parents = Category.where(ancestry: nil)
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:signup,keys:[])
  # end
end

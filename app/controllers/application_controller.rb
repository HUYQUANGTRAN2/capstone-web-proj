# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  helper_method :current_user, :signed_in?
  include Turbo::Native::Navigation

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def signed_in?
    current_user.present?
  end

  def require_sign_in
    return if signed_in?

    session[:return_to] = request.fullpath

    redirect_to sign_in_path,
      alert: "Please sign in first."
  end
end

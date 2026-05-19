# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to(
        session.delete(:return_to) || notes_path,
        notice: "Signed in successfully."
      )
    else
      flash.now[:alert] = "Invalid email or password."

      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    redirect_to sign_in_path, notice: "Signed out successfully."
  end
end

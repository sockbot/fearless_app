class PasswordResetTokensController < ApplicationController
    
  skip_before_action :authenticate!, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    user.regenerate_password_reset_token
    if user.save
      flash[:notice] = "New password reset token created."
      redirect_to login_path
    else
      flash[:alert] = "Couldn't regenerate password reset token. Try again"
      render :new, status: :unprocessable_entity
    end
  end
end
class UsersController < ApplicationController
  def new
    @user = User.new
  end 

  def create
    @user = User.new(user_params)
    
    @user.email.downcase!
    
    if @user.save
      flash[:notice] = "Account created successfully!"
      redirect_to root_path
    else
      flash[:alert] = "Couldn't create account. Try again"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

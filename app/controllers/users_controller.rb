class UsersController < ApplicationController
  def top
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render new_user_path
    end

  end

  def index

  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end

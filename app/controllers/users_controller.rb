class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:show, :create]}


  def top

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to root_path
    else
      render new_user_path
    end

  end

  def index

  end

  def show
    @user = User.find(params[:id])
    @talks = @user.talks
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end

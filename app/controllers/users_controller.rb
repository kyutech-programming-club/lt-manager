class UsersController < ApplicationController
  before_action :authenticate_user, only: %i[show index]
  before_action :correct_user, only: %i[edit update]

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
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @talks = @user.talks
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :status)
  end

  def correct_user
    user = User.find(params[:id])
    return if user == current_user

    redirect_to root_path, danger: "特定しますた、プロ研追放します"
  end
end

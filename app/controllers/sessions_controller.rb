class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      log_in user
      redirect_to root_path, success: "ようこそ！陰キャの" + user.name + "!"
    else
      redirect_to login_path, danger: "なんか間違ってへん？もしかしてスパイ？"
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end

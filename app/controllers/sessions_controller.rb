class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      log_in user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end

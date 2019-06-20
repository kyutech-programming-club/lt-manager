class ApplicationController < ActionController::Base
  include SessionsHelper

  add_flash_types :success, :info, :warning, :danger


  def correct_user
    user = User.find(params[:id])
    return if user == current_user

    redirect_to root_path, danger: "特定しますた、プロ研追放します"
  end
end

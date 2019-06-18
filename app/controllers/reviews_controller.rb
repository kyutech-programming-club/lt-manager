class ReviewsController < ApplicationController
  before_action :authenticate_user


  def create
    talk = Talk.find(params[:talk_id])
    review = talk.reviews.build(comment: params[:comment])
    review.user_id = current_user.id
    if review.save
      #flash
      redirect_to talk
    else
      redirect_to talk
    end
  end

  def destroy
    review = Review.find(params[:id])
    talk = review.talk
    review.destroy
    flash[:success] = "コメントを削除しました"
    redirect_to talk
  end
end

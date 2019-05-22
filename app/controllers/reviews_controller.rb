class ReviewsController < ApplicationController

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

end

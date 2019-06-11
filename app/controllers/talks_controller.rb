class TalksController < ApplicationController
  before_action :authenticate_user


  def show
    @talk = Talk.find(params[:id])
    @review = Review.new(user_id: current_user.id, talk_id: @talk.id)
    @reviews =Review.where(talk_id: @talk.id)
  end

  def new
    @talk = Talk.new
  end

  def create
    event = Event.find(params[:event_id])
    @talk = event.talks.build(talk_params)
    @talk.user_id = current_user.id
    if @talk.save
      redirect_to event
    else
      render :new
    end
  end

  private

  def talk_params
    params.permit(:title, :slide_url, :movie_url)
  end


end


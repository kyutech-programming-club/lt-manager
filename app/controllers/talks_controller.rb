class TalksController < ApplicationController
  before_action :authenticate_user
  before_action :correct_user, only: %i[edit update]

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

  def edit
    @talk = Talk.find(params[:id])
  end

  def update
    @talk = Talk.find(params[:id])
    if @talk.update(talk_params)
      redirect_to talk_path(@talk)
    else
      render :edit
      end
  end



  private

  def talk_params
    params.require(:talk).permit(:title, :slide_url, :movie_url)
  end


end


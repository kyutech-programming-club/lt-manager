class TalksController < ApplicationController
  def show
    @talk = Talk.find(params[:id])
  end

  def new
    @talk = Talk.new
  end

  def create
    @talk = Talk.new(talk_params)
    if @talk.save
      redirect_to event_path(id:@talk.event_id)
    else
      render new_talk_path
    end
  end

  private

  def talk_params
    params.require(:talk).permit(:title, :slide_url, :movie_url, )
  end

end


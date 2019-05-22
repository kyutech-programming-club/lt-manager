class TalksController < ApplicationController
  def show
    @talk = Talk.find(params[:id])
  end

  def new

  end

  def create
    event = Event.find(params[:event_id])
    talk = event.talks.build(talk_params)
    talk.user_id = current_user.id
    if talk.save
      redirect_to event
    else
      render new_event_talk_path(event_id: event.id)
    end
  end

  private

  def talk_params
    params.permit(:title, :slide_url, :movie_url)
  end


end


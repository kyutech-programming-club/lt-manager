class EventsController < ApplicationController
  before_action :authenticate_user

  def top

  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @talks = Talk.where(event_id: @event.id)

  end

  def new
    @event = Event.new

  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(id: @event.id)
    else
      render new_event_path
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to events_path
    else
      render :edit
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_time, :end_time, :location)
  end

end

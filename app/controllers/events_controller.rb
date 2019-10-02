class EventsController < ApplicationController
  before_action :authenticate_user

  def top

  end

  def index
    @events = Event.all.order(:start_time)
    @time = Time.now
    @now = []
    @stock = []
    @old = []
  end

  def show
    @event = Event.find(params[:id])
    @talks = Talk.where(event_id: @event.id).order(:sequence)
    @joins = UserEvent.where(event_id: params[:id])
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

  def shuffle
    talks = Talk.where(event_id: params[:event_id])
    t_length = talks.length
    seq = (1..t_length).to_a.shuffle
    talks.each_with_index do |f, i|
      f.sequence = seq[i]
      f.save
    end
    redirect_to event_path(id: params[:event_id])
  end

  def join
    join = UserEvent.new(user_id: current_user.id, event_id: params[:event_id])
    join.save
    redirect_to event_path(id: params[:event_id])
  end

  def drop
    join = UserEvent.find_by(user_id: current_user.id, event_id: params[:event_id])
    join.destroy
    talk = Talk.find_by(user_id: current_user.id, event_id: params[:event_id])
    unless talk.blank?
    talk.destroy
    end
    redirect_to event_path(id: params[:event_id])
  end


  private

  def event_params
    params.require(:event).permit(:title, :start_time, :end_time, :location)
  end

end

class TalksController < ApplicationController
  before_action :authenticate_user
  before_action :correct_user, only: %i[edit update destroy]

  def show
    @talk = Talk.find(params[:id])
    @talks = Talk.where(event_id: @talk.event_id)
    @review = Review.new(user_id: current_user.id, talk_id: @talk.id)
    @reviews =Review.where(talk_id: @talk.id)

    respond_to do |format|
      format.html
      format.json {
        @new_reviews = Review.where('id > ? and talk_id = ?', params[:review][:id], @talk.id)
      }
    end
  end

  def new
    @talk = Talk.new
  end

  def create
    event = Event.find(params[:event_id])
    @talk = event.talks.build(talk_params)
    @talk.user_id = current_user.id
    talks = Talk.where(event_id: event)

    if talks.empty?
      @talk.sequence = 1
    else
      @talk.sequence = Talk.where(event_id: event).order(:sequence).last.sequence + 1
    end

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
      redirect_to talk_path(@talk), success: "変更完了！"
    else
      render :edit
      end
  end

  def destroy
    talk = Talk.find(params[:id])
    talk.destroy
    redirect_to event_path(id: talk.event_id), success: "また発表してね！"
  end


  private

  def talk_params
    params.require(:talk).permit(:title, :slide_url, :movie_url)
  end

  def correct_user
    talk = Talk.find(params[:id])
    user = talk.user
    return if user == current_user

    redirect_to root_path, danger: "特定しますた、プロ研追放します"
  end

end


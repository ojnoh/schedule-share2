class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @event = Event.new
    @events = current_user.events.reverse_order
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    @event.save
    redirect_to events_path
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event), notice: "編集しました"
    else
      render 'edit', notice: "達成できなかった理由を記載してください"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path, notice:"削除しました"
  end


  private
    def event_params
        params.require(:event).permit(:title, :start_time, :end_time, :user_id, :body, :genre, :record_flg, :reason)
    end


end

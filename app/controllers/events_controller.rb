class EventsController < ApplicationController
  
  def new
    @event = Event.new
    @events = Genre.all
  end
  
  def create
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
  end
  
  def destroy
  end
  
  
end

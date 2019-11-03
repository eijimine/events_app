class EventsController < ApplicationController

  def index
    @events = Event.all.limit(5)
  end

  def new
    @users = User.all
  end

  def create
    puts params.inspect
    @event = Event.new(event_params) 
    @event.save
    redirect_to @event
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:id, :name, :event_type, :date, :duration, :location, :description, :max_participants, :start_time, :end_time)
  end

end

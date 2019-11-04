class EventsController < ApplicationController

  def index
    if params[:name]
      @events = Event.where('name LIKE ?', "%#{params[:name]}%")
    elsif params[:search]
      @search = EventSearch.new(params[:search])
      @events = @search.scope
    else
      @events = Event.all
    end
  end

  def new
    @users = User.all
  end

  def create
    @event = Event.new(event_params) 
    if params[:speaker]
      @event.users << User.find_by(id: params[:speaker])
    end
    @event.save
    redirect_to @event
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:id, :name, :event_type, :date, :duration, :location, :description, :max_participants, :start_time, :end_time, :search)
  end

end

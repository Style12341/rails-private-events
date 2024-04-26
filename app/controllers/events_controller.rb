class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees || []
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:notice] = 'Event created!'
      redirect_to @event
    else
      flash.now[:alert] = 'Failed to create event'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.creator != current_user
      flash[:alert] = 'You can only delete your own events'
      redirect_to @event
    end
    @event.delete
    flash[:notice] = 'Event deleted'
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :description)
  end
end

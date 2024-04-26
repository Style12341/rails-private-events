class EventAttendanceController < ApplicationController
  before_action :authenticate_user!
  def create
    @event = Event.find(params[:event_id])
    if current_user == @event.creator
      flash[:alert] = 'You cannot attend your own event'
      redirect_to @event
      return
    end
    @event.attendees << current_user
    redirect_to @event
  end

  def destroy
    @event = Event.find(params[:event_id])
    if current_user == @event.creator
      flash[:alert] = 'You cannot unattend your own event'
      redirect_to @event
      return
    end

    @event.attendees.delete(current_user)
    redirect_to @event
  end
end

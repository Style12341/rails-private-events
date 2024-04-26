class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @events = @user.events
    @attended_events = @user.attended
  end
end

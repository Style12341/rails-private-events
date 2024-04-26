class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show]
  def show
    @user = User.find(params[:id])
    if @user != current_user
      flash[:alert] = 'You can only view your own profile'
      redirect_to root_path
    end
    @events = @user.events
    @attended_events = @user.attended
  end
end

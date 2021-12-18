class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @events = Event.where(user_id: @user.id)
    @event = Event.new
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :nickname, :profile_image, :genre, :point)
  end


end

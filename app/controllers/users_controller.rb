class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    #検索フォームが空の場合全表示
    if (params[:search] == nil || params[:search] == '')
      @users= User.all
    else
    #部分検索
      @users = User.where("nickname LIKE ? ",'%' + params[:search] + '%')
    end
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(@user)
    end
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

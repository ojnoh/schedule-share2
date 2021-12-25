class FavoritesController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    favorite = current_user.favorites.new(favorite_user_id: @user.id)
    if @user != current_user
      favorite.save!
    end
    #非同期通信はpathを削除する
    #redirect_to user_path(user)
  end

  def destroy
    @user = User.find(params[:user_id])
    favorite = current_user.favorites.find_by(favorite_user_id: @user.id)
    favorite.destroy
    #非同期通信はpathを削除する
    #redirect_to user_path(user)
  end
end

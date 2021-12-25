class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  
  #いいねした人を持ってきている
  has_many :favorites, dependent: :destroy
  
  #いいねしてくれた人をfavoriteの中のfavorite_user_idを軸に持ってきている
  has_many :favorite_users, class_name: 'Favorite', foreign_key: 'favorite_user_id'


  def favorited_by?(user)
    favorites.where(favorite_user_id: user.id).exists?
  end

  attachment :profile_image


  enum genre: {
        室内運動:0,#室内トレーニングを中心に運動をする
        室外運動:1,}#室外トレーニングを中心に運動する

  validates :name, presence: true
  validates :nickname, presence: true
  validates :genre, presence: true, on: :update
  validates :point, presence: true, on: :update
  validates :email, presence: true

end

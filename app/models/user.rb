class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  attachment :profile_image


  enum genre: {
        室内運動:0,#室内トレーニングを中心に運動をする
        室外運動:1,}#室外トレーニングを中心に運動する

  validates :name, presence: true
  validates :nickname, presence: true
  validates :genre, presence: true
  validates :point, presence: true
  validates :email, presence: true

end

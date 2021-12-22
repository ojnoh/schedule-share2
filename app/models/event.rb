class Event < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  enum genre: {
        室内運動:0,#室内トレーニングを中心に運動をする
        室外運動:1,}#室外トレーニングを中心に運動する


end

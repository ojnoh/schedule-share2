class Event < ApplicationRecord

  belongs_to :user



  enum genre: {
        室内運動:0,#室内トレーニングを中心に運動をする
        室外運動:1,}#室外トレーニングを中心に運動する


  validates :title, presence: true
  validates :body, presence: true
  validates :genre, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  #record_flgがfalseの場合、reasonの入力が必要
  validate :reason_valid?, on: :update

  private

  def reason_valid?
    if record_flg == false
      errors.add(:reason)
    end
  end


end

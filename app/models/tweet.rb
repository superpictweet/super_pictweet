class Tweet < ApplicationRecord
  validates_with PostTweetValidator

  has_many :comments

  belongs_to :user
  has_many :likes, dependent: :destroy
  mount_uploader :image, ImageUploader

  acts_as_taggable

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end

class Tweet < ApplicationRecord
  validates_with PostTweetValidator

  has_many :comments

  belongs_to :user

  mount_uploader :image, ImageUploader
end

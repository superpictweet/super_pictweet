class Tweet < ApplicationRecord
  validates_with PostTweetValidator

  belongs_to :user
  mount_uploader :image, ImageUploader
end

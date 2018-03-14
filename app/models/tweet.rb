class Tweet < ApplicationRecord
  validates :image, url_format: true
  validates_with PostTweetValidator

  belongs_to :user
  mount_uploader :image, ImageUploader
end

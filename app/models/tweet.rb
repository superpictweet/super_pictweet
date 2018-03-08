class Tweet < ApplicationRecord
  validates :image, allow_blank: true, format: /\A#{URI::regexp(%w(http https))}\z/
  validates :image_or_text, presence: true

  def image_or_text
    image.presence || text.presence
  end
end

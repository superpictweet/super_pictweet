class PostTweetValidator < ActiveModel::Validator
  def validate(record)
    if record.text.nil? && record.image.nil?
      record.errors[:image_or_text] << (options[:message] || '全てのフォームが未入力です')
    end
  end
end

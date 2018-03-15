class PostTweetValidator < ActiveModel::Validator
  def validate(record)
    if record.text.blank? && record.image.file.blank?
      record.errors[:image_or_text] << (options[:message] || '全てのフォームが未入力です')
    end
  end
end

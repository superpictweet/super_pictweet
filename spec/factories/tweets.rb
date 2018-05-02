FactoryBot.define do
  factory :tweet do
    text Faker::Lorem.sentence
    image File.open("#{Rails.root}/public/images/IMG_2545.jpg")
    user
  end
end

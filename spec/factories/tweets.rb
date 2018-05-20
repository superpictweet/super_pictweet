FactoryBot.define do
  factory :tweet do
    text Faker::Lorem.sentence
    image File.open("#{Rails.root}/public/images/IMG_2545.jpg")
    user

    trait :invalid do
      text nil
      image nil
    end
  end
end

FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(8)
    name Faker::Name.name
    initialize_with { User.find_or_create_by(email: Faker::Internet.email)}
    password password
    password_confirmation password
    provider 'facebook'
    role 'normal'
  end

  factory :admin, class: User do
    password = Faker::Internet.password(8)
    name Faker::Name.name
    initialize_with { User.find_or_create_by(email: Faker::Internet.email)}
    password password
    password_confirmation password
    provider 'facebook'
    role 'admin'
  end
end

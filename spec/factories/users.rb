FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 6)
    nickname {Faker::Name.last_name}
    sequence(:email) {Faker::Internet.email}
    image {File.open("#{Rails.root}/public/images/usertest.png")}
    birth_day {Faker::Date.birthday}
    password {password}
    password_confirmation {password}
  end
end
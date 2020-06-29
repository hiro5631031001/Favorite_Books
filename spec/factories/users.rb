FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 6)
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    image image {File.open("#{Rails.root}/public/images/usertest.png")}
    birth_day {Faker::Date.birthday}
    password {password}
    password_confirmation {password}
  end
end
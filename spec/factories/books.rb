FactoryBot.define do
  factory :book do
    title = {Faker::Book.title}
    author {Faker::Book.author}
    publisher {Faker::Book.publisher}
    category {Faker::Number.between(from: 1, to: 8)}
    status {Faker::Number.between(from: 1, to: 2)}
    kindle {Faker::Number.between(from: 1, to: 2)}
    image {File.open("#{Rails.root}/public/images/booktest.jpg")}
    buy_date {Faker::Date.between(from: '2000-01-01', to: Date.today)}
    user
  end
end
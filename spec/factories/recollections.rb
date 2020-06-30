FactoryBot.define do
  factory :recollection do
    read_term {Faker::Number.between(from: 1, to: 5)}
    readed_day {Faker::Date.between(from: '2000-01-01', to: Date.today)}
    point {Faker::Number.between(from: 1, to: 5)}
    phrase {Faker::Lorem.sentence}
    note {Faker::Lorem.sentence}
    book
  end
end
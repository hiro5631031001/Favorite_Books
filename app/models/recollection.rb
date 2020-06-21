class Recollection < ApplicationRecord
  belongs_to :book

  enum read_term: {
    "-----": 0,
    one_day: 1,
    two_three_days: 2,
    one_week: 3,
    two_four_weeks: 4,
    one_month_over: 5
  }, _prefix: true

end

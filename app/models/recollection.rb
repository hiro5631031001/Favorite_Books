class Recollection < ApplicationRecord
  belongs_to :book

  validates :read_term,     presence: true
  validates :readed_day,    presence: true
  validates :point,         presence: true
  validates :note,          presence: true, length: { maximum:3000}
  validates :phrase,        length: { maximum:1000 }
 
  enum read_term: {
    "-----": 0,
    one_day: 1,
    two_three_days: 2,
    one_week: 3,
    two_four_weeks: 4,
    one_month_over: 5
  }, _prefix: true

  enum point: {
    "-----": 0,
    one_point: 1,
    two_points: 2,
    three_points: 3,
    four_points: 4,
    five_points: 5
  }, _prefix: true


end

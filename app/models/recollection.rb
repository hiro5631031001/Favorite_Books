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

  enum point: {
    "-----": 0,
    one_point: 1,
    two_points: 2,
    three_points: 3,
    four_points: 4,
    five_points: 5
  }, _prefix: true

  enum reread_timing: {
    "-----": 0,
    knowledge: 1,
    motivation: 2,
    decision: 3,
    stress: 4,
    feel_down: 5,
    lost_love: 6,
    diversion: 7,
    relax: 8,
    nothing_special: 9
  }, _prefix: true

end

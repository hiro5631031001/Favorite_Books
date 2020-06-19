class Book < ApplicationRecord
  belongs_to :user

  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :status, presence: true
  validates :buy_date, presence: true
  # validates :buy_date, date: true, allow_blank: true
  validates :category,
            inclusion: { in: ["novel",
                              "management",
                              "economy",
                              "finance",
                              "history",
                              "motivation",
                              "comic",
                              "etc"] }

  enum category: {
    "-----": 0,
    novel: 1,
    management: 2,
    economy: 3,
    finance: 4,
    history: 5,
    motivation: 6,
    comic: 7,
    etc: 8
  }, _prefix: true

end

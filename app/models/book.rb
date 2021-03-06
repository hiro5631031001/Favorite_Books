class Book < ApplicationRecord
  belongs_to :user
  has_many :recollections, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :title,      presence: true
  validates :author,     presence: true
  validates :publisher,  presence: true
  validates :status,     presence: true
  validates :buy_date,   presence: true
  validates :kindle ,    presence: true
  validates :image,      presence: true
  validates :category,
            inclusion: { in: ["novel",
                              "management",
                              "economy",
                              "philosophy",
                              "psychology",
                              "motivation",
                              "comic",
                              "etc"] }

  validates :kindle,
            inclusion: { in: ["book_of_lectures",
                              "kindle"] }

  enum category: {
    "-----": 0,
    novel: 1,
    management: 2,
    economy: 3,
    philosophy: 4,
    psychology: 5,
    motivation: 6,
    comic: 7,
    etc: 8
  }, _prefix: true

  enum status: {
    book_recollection_none: 0,
    book_recollection_exist: 1,
    book_following: 2
  }, _prefix: true

  enum kindle: {
    "-----": 0,
    book_of_lectures: 1,
    kindle: 2
  }, _prefix: true

  def book_read
    self.status = "book_recollection_exist"
    save
  end
end

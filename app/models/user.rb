class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :books
  mount_uploader :image, ImageUploader

  validates :nickname,  presence: true
  validates :nickname,  length: { maximum: 20, message: "は20文字以下で入力してください" }, allow_blank: true
  validates :email,     presence: true, uniqueness: true
  validates :birth_day, presence: true
  validates :image,     presence: true

end

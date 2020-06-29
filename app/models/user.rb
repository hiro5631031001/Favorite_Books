class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :books
  mount_uploader :image, ImageUploader

  validates :nickname,  presence: true
  validates :email,     presence: true
  validates :email,     uniqueness: true
  validates :birth_day, presence: true
  validates :image,     presence: true


end

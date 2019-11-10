class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes
  mount_uploader :image, ImageUploader

  validates :name,                  presence: true, length: {maximum: 20}
  validates :email,                 presence: true, uniqueness: true, length: {maximum: 255}
  validates :password,              presence: true, length: {minimum: 6, maximum: 255}
  validates :password_confirmation, presence: true, length: {minimum: 6, maximum: 255}

end
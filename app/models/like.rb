class Like < ApplicationRecord

  belongs_to :user

  mount_uploader :image, ImageUploader

  validates :genre,       presence: true, length: {maximum: 50}
  validates :things,      presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 255}

end
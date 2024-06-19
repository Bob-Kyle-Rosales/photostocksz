class User < ApplicationRecord
  has_secure_password
  has_many :user_likes, dependent: :destroy  # Rename association
  has_many :photos, dependent: :destroy
  has_many :liked_photos, through: :likes, source: :photo

  validates :email, presence: true, uniqueness: true
end

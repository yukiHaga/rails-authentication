class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  # emailが一意であるか
  validates :email, presence: true, length: { maximum: 255 },
                    uniqueness: true
  validates :password, presence: true

  has_secure_password
end
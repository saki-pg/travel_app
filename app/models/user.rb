class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :passwords, presence: true
  validates :passwords_confirmation, presence: true, uniqueness: true, confirmation: true

  validates :image, presence: true
  # content_type: ['image/jpeg', 'image/jpg', 'image/png']

  validates :introduction, length: { in: 1..200 }

  has_many :posts
  has_many :reservations
end



class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, email_format: true, uniqueness: true
  validates :passwords, presence: true
  validates :passwords_confirmation, presence: true, uniqueness: true, confirmation: true

  validates :image,content_type: [:png, :jpg, :jpeg]

  validates :introduction, length: { in: 1..200 }

  has_many :posts
  has_many :reservations
end



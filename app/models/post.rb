class Post < ApplicationRecord

  validates :room_name, presence: true
  validates :room_introduction, length: { in: 1..100 }

  validates :price, presence: true

  validates :address, length: { in: 1..100 }
  validates :room_image,
    content_type: [:png, :jpg, :jpeg],
    size: { less_than_or_equal_to: 5.megabytes },
    dimension: { width: { max: 500 }, height: { max: 500 }}




  belongs_to :user
end


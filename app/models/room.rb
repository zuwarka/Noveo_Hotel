class Room < ApplicationRecord
  has_many :booking
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 5000 }
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0, 2})?\z/ }, numericality: { greater_than: 0 }
end
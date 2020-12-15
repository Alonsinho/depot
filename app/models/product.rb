class Product < ApplicationRecord
  validates :title, :description, :image_url, presence: true
  # Validates title length with personalised error message
  validates :title, length: {
    minimum: 10,
    message: 'Must be at least 10 characters' }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\z}i,
    message: 'Must be a URL for GIF, JPG or PNG image.' }
end

class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  belongs_to :size
  belongs_to :brand, optional: true
  has_many_attached :pictures
  validates :title, presence: true, length: {minimum: 20, maximum: 50 }
  validates :description, presence: true, length: {minimum: 20, maximum: 200 }
  validates :price, :pictures, presence: true
end

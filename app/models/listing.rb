class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  belongs_to :size
  belongs_to :brand, optional: true
  has_many_attached :pictures
end

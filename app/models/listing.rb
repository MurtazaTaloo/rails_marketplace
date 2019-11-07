class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :size
  belongs_to :brand
  has_many_attached :pictures
end

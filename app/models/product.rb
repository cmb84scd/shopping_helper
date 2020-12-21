class Product < ApplicationRecord
  validates :item, presence: true
end

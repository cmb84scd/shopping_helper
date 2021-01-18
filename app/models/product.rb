class Product < ApplicationRecord
  belongs_to :user
  has_one :item, dependent: :destroy
  
  validates :item, presence: true
end

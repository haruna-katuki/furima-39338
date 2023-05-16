class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :item_name, presence: true, length: { maximum: 40 }
end

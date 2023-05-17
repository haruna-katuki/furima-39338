class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :item_name, presence: true, length: { maximum: 40 }
  validates :caption, presence: true, length: { maximum: 1000 }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :state_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :postage_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, numericality: { in: 300..9999999 }, format: { with: /\A[0-9]+\z/ }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_day
end

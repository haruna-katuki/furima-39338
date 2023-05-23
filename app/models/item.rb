class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :image
    validates :item_name, length: { maximum: 40 }
    validates :caption, length: { maximum: 1000 }
    validates :price, presence: true
  end
  validates :category_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :state_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :postage_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :shipping_day_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :price, numericality: { only_integer: true, message: 'は半角数字にしてください' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は有効な範囲に設定してください' }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_day
end

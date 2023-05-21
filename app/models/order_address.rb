class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building, :telephone_number, :user_id, :item_id

  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :city, presence: true
  validates :house_number, presence: true
  validates :telephone_number, presence: true, format: {with: /\A[0-9]{11}\z/, message: "is invalid."}
  validates :user_id, presence: true
  validates :item_id, presence: true
end
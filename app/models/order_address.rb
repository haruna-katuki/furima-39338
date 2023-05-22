class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building, :telephone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :house_number
    validates :telephone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :house_number, presence: true
  validates :telephone_number, presence: true, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :token, presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                   building: building, telephone_number: telephone_number, order_id: order.id)
  end
end

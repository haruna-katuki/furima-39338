class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building, :telephone_number, :user_id, :item_id
end
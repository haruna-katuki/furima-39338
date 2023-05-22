FactoryBot.define do
  factory :order_address do
    token            { 'tok_abcdefghijk00000000000000000' }
    postal_code      { '123-4567' }
    prefecture_id    { Faker::Number.between(from: 2, to: 48) }
    city             { Faker::Address.city }
    house_number     { Faker::Address.street_address }
    building         { Faker::Address.building_number }
    telephone_number { Faker::Number.number(digits: 11) }
  end
end

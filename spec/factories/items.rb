FactoryBot.define do
  factory :item do
    item_name         {Faker::Lorem.word}
    caption           {Faker::Lorem.sentence}
    category_id       {Faker::Number.between(from: 2, to: 11)}
    state_id          {Faker::Number.between(from: 2, to: 7)}
    postage_id        {Faker::Number.between(from: 2, to: 3)}
    prefecture_id     {Faker::Number.between(from: 2, to: 48)}
    shipping_day_id   {Faker::Number.between(from: 2, to: 4)}
    price             {Faker::Number.between(from: 300, to: 9999999)}
    association :user
  end
end

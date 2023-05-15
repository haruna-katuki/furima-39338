FactoryBot.define do
  factory :user do
    Faker::Config.locale = :ja
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {'ao9Y6tfm3'}
    password_confirmation {password}
    family_name           {Faker::Name.last_name}
    first_name            {Faker::Name.first_name}
    family_name_kana      {'アアア'}
    first_name_kana       {'アアア'}
    birth_date            {'1999-9-9'}
  end
end
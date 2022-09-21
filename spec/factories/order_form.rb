FactoryBot.define do
  factory :order_form do

    zip { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city { Faker::Address.city }
    address1 { Faker::Address.street_address }
    address2 { Faker::Address.street_address }
    telephone {'09012345678'}
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end

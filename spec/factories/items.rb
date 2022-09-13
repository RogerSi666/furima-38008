FactoryBot.define do
  factory :item do
    title { Faker::Name.name }
    information { Faker::Lorem.sentence }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    image { Faker::Lorem.sentence }

    quality_id { 2 }
    post_price_id { 2 }
    prefecture_id { 2 }
    shipment_day_id { 2 }
    category_id { 2 }

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/public.png'), filename: 'public.png')
    end
  end
end

FactoryBot.define do
  factory :item do
    name {'aaa'}
    exposition {'aaaaaaaaaa'}
    category_id {2}
    condition_id {2}
    delivery_id {2}
    area_id {2}
    price {600}
    day_id {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
